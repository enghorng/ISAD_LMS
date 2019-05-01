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
    public partial class frmMoreDetail : Form
    {
        public frmMoreDetail(string id)
        {
            string s;
            InitializeComponent();
            lblID.Text = id;
            lblReader.Text = SQLDB.DB.Get1Record("select [ReaderName] from v_BorrowDetail where BorrowID = '"+id+"'");
            lblLibrarian.Text = SQLDB.DB.Get1Record("select [LibrarianName] from v_BorrowDetail where BorrowID = '" + id + "'");
            lblPrice.Text = SQLDB.DB.Get1Record("select sum([Price]) from v_BorrowDetail where BorrowID = '" + id + "'");
            lblBorrowD.Text = SQLDB.DB.Get1Record("select [BorrowDate] from v_BorrowDetail where BorrowID = '" + id + "'");
            lblEx.Text = SQLDB.DB.Get1Record("select [ExprieDate] from v_BorrowDetail where BorrowID = '" + id + "'");
            lblDaysLeft.Text = SQLDB.DB.Get1Record("select [Days Left] from v_BorrowDetail where BorrowID = '" + id + "'");
            lblDaysEx.Text = SQLDB.DB.Get1Record("select [Days Exceeded] from v_BorrowDetail where BorrowID = '" + id + "'");
            s = SQLDB.DB.Get1Record("select [Status] from v_BorrowDetail where BorrowID = '" + id + "'");
            if (s == "1")
                lblStatus.Text = "Not yet return";
            if (s == "0")
                lblStatus.Text = "Returned";
            SQLDB.DB.SQL_Grid(dgvMore, "select BookCode as [Book Code], Titel, count(BookCode) as Qty from v_BorrowDetail where BorrowID = '"+id+"' group by BookCode, Titel");
            this.MaximizeBox = false;            
            dgvMore.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }
    }
}
