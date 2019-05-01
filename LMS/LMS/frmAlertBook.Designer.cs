namespace LMS
{
    partial class frmAlertBook
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvAlertBook = new System.Windows.Forms.DataGridView();
            this.label7 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlertBook)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvAlertBook
            // 
            this.dgvAlertBook.AllowDrop = true;
            this.dgvAlertBook.AllowUserToAddRows = false;
            this.dgvAlertBook.AllowUserToDeleteRows = false;
            this.dgvAlertBook.AllowUserToOrderColumns = true;
            this.dgvAlertBook.AllowUserToResizeColumns = false;
            this.dgvAlertBook.AllowUserToResizeRows = false;
            this.dgvAlertBook.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvAlertBook.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SunkenVertical;
            this.dgvAlertBook.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAlertBook.Location = new System.Drawing.Point(74, 187);
            this.dgvAlertBook.Name = "dgvAlertBook";
            this.dgvAlertBook.ReadOnly = true;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Chantrea SR UI Low", 12F);
            dataGridViewCellStyle1.ForeColor = System.Drawing.Color.Red;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.Color.Blue;
            this.dgvAlertBook.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvAlertBook.RowTemplate.Height = 28;
            this.dgvAlertBook.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvAlertBook.Size = new System.Drawing.Size(1134, 426);
            this.dgvAlertBook.TabIndex = 9;
            this.dgvAlertBook.RowPostPaint += new System.Windows.Forms.DataGridViewRowPostPaintEventHandler(this.dgvAlertBook_RowPostPaint);
            // 
            // label7
            // 
            this.label7.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Minion Pro", 30F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.Blue;
            this.label7.Location = new System.Drawing.Point(695, 7);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(298, 84);
            this.label7.TabIndex = 35;
            this.label7.Text = "Alert Book";
            // 
            // panel1
            // 
            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(239)))), ((int)(((byte)(229)))));
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.label7);
            this.panel1.Location = new System.Drawing.Point(-1, 10);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1324, 100);
            this.panel1.TabIndex = 8;
            // 
            // frmAlertBook
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Azure;
            this.ClientSize = new System.Drawing.Size(1323, 676);
            this.Controls.Add(this.dgvAlertBook);
            this.Controls.Add(this.panel1);
            this.Name = "frmAlertBook";
            this.Text = "frmAlertBook";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmAlertBook_FormClosing);
            this.Load += new System.EventHandler(this.frmAlertBook_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvAlertBook)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvAlertBook;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Panel panel1;
    }
}