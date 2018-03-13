using STS.FolderOrginzerApp.models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;
using System.Windows.Forms;

namespace STS.FolderOrginzerApp
{
    public partial class Form1 : Form
    {
        int soundIdCounter = 1;
        int imageIdCounter = 1;
        List<Sound> soundsList = new List<Sound>();
        List<models.Image> imagesList = new List<models.Image>();
        List<SessionsSounds> sessionSounds = new List<SessionsSounds>();
        List<SoundImages> soundImages = new List<SoundImages>();

        string sql_addSound;
        string sql_addImages;
        string sql_addSoundImages;
        string sql_addSessionSounds;

        private void Init()
        {
            folderBrowserDialog1.SelectedPath = @"C:\STS\SoundTrainingProject\STS.WebApp.V2\STS.FrontEnd\src\assets\_support_files\ordered";
            soundIdCounter = 1;
            imageIdCounter = 1;
            soundsList = new List<Sound>();
            imagesList = new List<models.Image>();
            sessionSounds = new List<SessionsSounds>();
            soundImages = new List<SoundImages>();
        }

        public Form1()
        {
            InitializeComponent();
            Init();
        }

        private void folderBrowserDialog1_HelpRequest(object sender, EventArgs e)
        {

        }

        private void btnSelectRootFolder_Click(object sender, EventArgs e)
        {
            if (folderBrowserDialog1.ShowDialog() == DialogResult.OK)
            {
                lblSelectedRootFolder.Text = folderBrowserDialog1.SelectedPath;
            }


        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(folderBrowserDialog1.SelectedPath))
            {
                ShowError("Select root folder first...");
                return;
            }

            var modulesDirectories = Directory.GetDirectories(folderBrowserDialog1.SelectedPath);
            modulesDirectories.ToList().ForEach(moduleDir =>
            {
                var moduleId = int.Parse(new DirectoryInfo(moduleDir).Name);
                var moduleSessionsDirs = Directory.GetDirectories(moduleDir);
                moduleSessionsDirs.ToList().ForEach(sessionFolder =>
                {
                    var soundsDir = Directory.GetDirectories(sessionFolder);
                    var sessionId = int.Parse(new DirectoryInfo(sessionFolder).Name);
                    soundsDir.ToList().ForEach(soundFolder =>
                    {
                        RenameFiles(soundFolder);
                        ProcessSoundFolder(moduleId, sessionId, soundFolder);
                    });
                });

            });
            InsetToDb();

            ShowError("done....");
        }

        private void InsetToDb()
        {
            using (TransactionScope trans = new TransactionScope())
            {
                InsertSounds();

                InsertImages();

                InsertSessionSounds();

                InsertSoundImages();

                trans.Complete();

                Init();
            }

        }

        private void InsertSounds()
        {
            sql_addSound = "SET IDENTITY_INSERT Sound ON ";
            sql_addSound += Environment.NewLine;
            soundsList.ForEach(sound =>
            {
                sql_addSound += $"INSERT Sound (ID, Name) Values ({sound.Id}, '{sound.Name}')";
                sql_addSound += Environment.NewLine;
                //sql_addSound += "GO";
                //sql_addSound += Environment.NewLine;
            });

            sql_addSound += "SET IDENTITY_INSERT Sound OFF ";

            Db.ExcueteQuery(sql_addSound);

        }

        private void InsertImages()
        {
            sql_addImages = "SET IDENTITY_INSERT Image ON ";
            sql_addImages += Environment.NewLine;
            imagesList.ForEach(image =>
            {
                sql_addImages += $"INSERT Image (ID, Name) Values ({image.Id}, '{image.Name}')";
                sql_addImages += Environment.NewLine;
                //sql_addImages += "GO";
                //sql_addImages += Environment.NewLine;
            });

            sql_addImages += "SET IDENTITY_INSERT Image OFF ";

            Db.ExcueteQuery(sql_addImages);
        }
        private void InsertSessionSounds()
        {
            sql_addSessionSounds += Environment.NewLine;
            sessionSounds.ForEach(sessionSound =>
            {
                sql_addSessionSounds += $"INSERT SessionsSounds (SessionId, SoundId) Values ({sessionSound.SessionId}, {sessionSound.SoundId})";
                sql_addSessionSounds += Environment.NewLine;
                //sql_addSessionSounds += "GO";
                //sql_addSessionSounds += Environment.NewLine;
            });

            Db.ExcueteQuery(sql_addSessionSounds);
        }

        private void InsertSoundImages()
        {
            sql_addSoundImages += Environment.NewLine;
            soundImages.ForEach(soundImage =>
            {
                sql_addSoundImages += $"INSERT SoundImages (SoundId, ImageId) Values ({soundImage.SoundId}, {soundImage.ImageId})";
                sql_addSoundImages += Environment.NewLine;
                //sql_addSoundImages += "GO";
                //sql_addSoundImages += Environment.NewLine;
            });

            Db.ExcueteQuery(sql_addSoundImages);
        }



        private void ProcessSoundFolder(int moduleId, int sessionId, string soundFolder)
        {
            List<int> addedSoundsId = new List<int>();
            List<int> addedImagesId = new List<int>();

            var folderFiles = Directory.GetFiles(soundFolder);
            var soundsFiles = folderFiles.Where(f => f.Contains(".mp3"));
            var imagesFiles = folderFiles.Where(f => f.ToLower().Contains(".png"));

            // add sounds 
            soundsFiles.ToList().ForEach(soundFile =>
            {
                soundsList.Add(new Sound() { Id = soundIdCounter, Name = Path.GetFileNameWithoutExtension(soundFile) });

                addedSoundsId.Add(soundIdCounter);
                soundIdCounter++;
            });

            // add images
            imagesFiles.ToList().ForEach(imageFile =>
            {
                imagesList.Add(new models.Image() { Id = imageIdCounter, Name = Path.GetFileNameWithoutExtension(imageFile) });

                addedImagesId.Add(imageIdCounter);
                imageIdCounter++;
            });

            addedSoundsId.ForEach(soundId =>
            {
                // link sounds with images
                addedImagesId.ForEach(imageId =>
                {
                    soundImages.Add(new SoundImages() { SoundId = soundId, ImageId = imageId });
                });

                // link sounds with sessions
                sessionSounds.Add(new SessionsSounds() { SessionId = sessionId, SoundId = soundId });
            });


        }

        private void ShowError(string message)
        {
            MessageBox.Show(message);
        }

        private void btnRename_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(folderBrowserDialog1.SelectedPath))
            {
                ShowError("Select folder first....");
                return;
            }

            RenameFiles(folderBrowserDialog1.SelectedPath);
            ShowError("done...");
        }

        private void RenameFiles(string folderPath)
        {
            foreach (var file in Directory.GetFiles(folderPath))
            {
                File.Move(file, file.ToLowerInvariant());
            }
        }
    }
}
