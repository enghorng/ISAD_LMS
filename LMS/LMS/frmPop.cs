using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LMS
{
    public partial class frmPop : Form
    {
        public frmPop()
        {
            InitializeComponent();
            SQLDB.DB.SQL_Grid(dgvBook, "select top 3 t.Code, t.Titel, t.[Qty], t.[Author], t.[Year Of Printing] from v_BorrowDetail as v inner join v_Book as t on v.BookCode = t.Code group by t.Code, t.Titel, t.[Qty], t.[Author], t.[Year Of Printing] order by count(t.Code) desc");
            this.MaximizeBox = false;
            dgvBook.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void btnApply_Click(object sender, EventArgs e)
        {
            SQLDB.DB.SQL_Grid(dgvBook, "select top "+txtTop.Text+" t.Code, t.Titel, t.[Qty], t.[Author], t.[Year Of Printing] from v_BorrowDetail as v inner join v_Book as t on v.BookCode = t.Code group by t.Code, t.Titel, t.[Qty], t.[Author], t.[Year Of Printing] order by count(t.Code) desc");
            this.MaximizeBox = false;
            dgvBook.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }
    }
}
