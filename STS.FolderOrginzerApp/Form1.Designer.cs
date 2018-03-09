namespace STS.FolderOrginzerApp
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.btnSelectRootFolder = new System.Windows.Forms.Button();
            this.lblSelectedRootFolder = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.button1);
            this.panel1.Controls.Add(this.lblSelectedRootFolder);
            this.panel1.Controls.Add(this.btnSelectRootFolder);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Location = new System.Drawing.Point(13, 13);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(408, 252);
            this.panel1.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(3, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(67, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Root Folder:";
            // 
            // folderBrowserDialog1
            // 
            this.folderBrowserDialog1.HelpRequest += new System.EventHandler(this.folderBrowserDialog1_HelpRequest);
            // 
            // btnSelectRootFolder
            // 
            this.btnSelectRootFolder.Location = new System.Drawing.Point(101, 13);
            this.btnSelectRootFolder.Name = "btnSelectRootFolder";
            this.btnSelectRootFolder.Size = new System.Drawing.Size(121, 23);
            this.btnSelectRootFolder.TabIndex = 1;
            this.btnSelectRootFolder.Text = "Select folder..";
            this.btnSelectRootFolder.UseVisualStyleBackColor = true;
            this.btnSelectRootFolder.Click += new System.EventHandler(this.btnSelectRootFolder_Click);
            // 
            // lblSelectedRootFolder
            // 
            this.lblSelectedRootFolder.AutoSize = true;
            this.lblSelectedRootFolder.Location = new System.Drawing.Point(6, 46);
            this.lblSelectedRootFolder.Name = "lblSelectedRootFolder";
            this.lblSelectedRootFolder.Size = new System.Drawing.Size(0, 13);
            this.lblSelectedRootFolder.TabIndex = 2;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(6, 58);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(216, 23);
            this.button1.TabIndex = 3;
            this.button1.Text = "Update Database...";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(990, 620);
            this.Controls.Add(this.panel1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.Button btnSelectRootFolder;
        private System.Windows.Forms.Label lblSelectedRootFolder;
        private System.Windows.Forms.Button button1;
    }
}

