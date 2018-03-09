using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace STS.FolderOrginzerApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            folderBrowserDialog1.SelectedPath = @"D:\STSResourcesSample";
        }

        private void folderBrowserDialog1_HelpRequest(object sender, EventArgs e)
        {

        }

        private void btnSelectRootFolder_Click(object sender, EventArgs e)
        {
            if(folderBrowserDialog1.ShowDialog() == DialogResult.OK)
            {
                lblSelectedRootFolder.Text = folderBrowserDialog1.SelectedPath;
            }

            var modulesDirectories = Directory.GetDirectories(folderBrowserDialog1.SelectedPath);
            modulesDirectories.ToList().ForEach(moduleDir =>
            {
                var moduleSessionsDir = Directory.GetDirectories(moduleDir);

            });
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(folderBrowserDialog1.SelectedPath))
            {
                ShowError("Select root folder first...");
            }
        }

        private void ShowError(string message)
        {
            MessageBox.Show(message);
        }
    }
}
