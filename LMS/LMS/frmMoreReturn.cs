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
    public partial class frmMoreReturn : Form
    {
        public frmMoreReturn(string id)
        {
            InitializeComponent();
            SQLDB.DB.SQL_Grid(dgvMore, "SELECT ReturnID,BookCode,Titel,count(BookCode) as Qty FROM v_ReturnDetail where ReturnID = '" + id + "' group by ReturnID,BookCode,Titel");
            this.MaximizeBox = false;
            dgvMore.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            lblID.Text = id;
            lblReader.Text = SQLDB.DB.Get1Record("select ReaderName from v_ReturnDetail where ReturnID = '" + id + "'");
            lblLibrarian.Text = SQLDB.DB.Get1Record("select LibrarianName from v_ReturnDetail where ReturnID = '" + id + "'");
            lblTotal.Text = SQLDB.DB.Get1Record("select sum([Total Amount]) AS [Total Amount] from v_ReturnDetail where ReturnID = '" + id + "'") + " R";
            lblDate.Text = SQLDB.DB.Get1Record("select [ReturnDate] from v_ReturnDetail where ReturnID = '" + id + "'");
            lblDaysEx.Text = SQLDB.DB.Get1Record("select [Days Exceeded] from v_ReturnDetail where ReturnID = '" + id + "'");
        }
    }
}
