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
    public partial class frmBorrowDetail : Form
    {
        public static int m;
        public frmBorrowDetail()
        {
            InitializeComponent();
            m = 1;
        }
       
        private void frmBorrowDetail_Load(object sender, EventArgs e)
        {
            SQLDB.DB.SQL_Grid(dgvBorrwDetail, "SELECT * FROM v_BorrowD");
            dgvBorrwDetail.Columns["Status"].Visible = false;
            this.MaximizeBox = false;
            dgvBorrwDetail.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            double result = 0;
            for (int i = 0; i < dgvBorrwDetail.Rows.Count; i++)
                result += Convert.ToDouble(dgvBorrwDetail.Rows[i].Cells["Price"].Value);
            txtTotal.Text = result.ToString() + "R";
            txtReaders.Text = SQLDB.DB.Get1Record("select count([Reader Name]) [Readers] from(select [Reader Name] from v_BorrowD group by [Reader Name]) as GG");
        }

        private void dgvBorrwDetail_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            var grid = sender as DataGridView;
            var rowIdx = (e.RowIndex + 1).ToString();
            var centerFormat = new StringFormat()
            {
                //right alignment might actually make more sense for numbers
                Alignment = StringAlignment.Center,
                LineAlignment = StringAlignment.Center
            };

            var headerBounds = new Rectangle(e.RowBounds.Left, e.RowBounds.Top, grid.RowHeadersWidth, e.RowBounds.Height);
            e.Graphics.DrawString(rowIdx, this.Font, SystemBrushes.ControlText, headerBounds, centerFormat);
        }

        private void frmBorrowDetail_FormClosing(object sender, FormClosingEventArgs e)
        {
            m = 0;
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            if (rdoAll.Checked)
            {
                SQLDB.DB.SQL_Grid(dgvBorrwDetail, "SELECT * FROM v_BorrowD where [Borrow Date] between '" + dateFrom.Value + "' and '" + dateTo.Value + "' ");
                txtReaders.Text = SQLDB.DB.Get1Record("select count([Reader Name]) [Readers] from(select [Reader Name] from v_BorrowD where [Borrow Date] between '" + dateFrom.Value + "' and '" + dateTo.Value + "' group by [Reader Name]) as GG");
                if (txtReaders.Text == "" || txtReaders.Text == null)
                    txtReaders.Text = "0";
            }
            if (rdoNot.Checked)
            {
                SQLDB.DB.SQL_Grid(dgvBorrwDetail, "SELECT * FROM v_BorrowD where [Borrow Date] between '" + dateFrom.Value + "' and '" + dateTo.Value + "' and Status = 1 ");
                txtReaders.Text = SQLDB.DB.Get1Record("select count([Reader Name]) [Readers] from(select [Reader Name] from v_BorrowD where [Borrow Date] between '" + dateFrom.Value + "' and '" + dateTo.Value + "' and Status = 1 group by [Reader Name]) as GG");
                if (txtReaders.Text == "" || txtReaders.Text == null)
                    txtReaders.Text = "0";
            }
            if (rdoReturned.Checked)
            {
                SQLDB.DB.SQL_Grid(dgvBorrwDetail, "SELECT * FROM v_BorrowD where [Borrow Date] between '" + dateFrom.Value + "' and '" + dateTo.Value + "' and Status = 0 ");
                txtReaders.Text = SQLDB.DB.Get1Record("select count([Reader Name]) [Readers] from(select [Reader Name] from v_BorrowD where [Borrow Date] between '" + dateFrom.Value + "' and '" + dateTo.Value + "' and Status = 0 group by [Reader Name]) as GG");
                if (txtReaders.Text == "" || txtReaders.Text == null)
                    txtReaders.Text = "0";
            }
            this.MaximizeBox = false;
            dgvBorrwDetail.Columns["Status"].Visible = false;
            dgvBorrwDetail.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            double result = 0;
            for (int i = 0; i < dgvBorrwDetail.Rows.Count; i++)
                result += Convert.ToDouble(dgvBorrwDetail.Rows[i].Cells["Price"].Value);
            txtTotal.Text = result.ToString() + "R";            
        }

        private void rdoNot_CheckedChanged(object sender, EventArgs e)
        {
            SQLDB.DB.SQL_Grid(dgvBorrwDetail, "SELECT * FROM v_BorrowD where Status = 1");
            this.MaximizeBox = false;
            dgvBorrwDetail.Columns["Status"].Visible = false;
            dgvBorrwDetail.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            double result = 0;
            for (int i = 0; i < dgvBorrwDetail.Rows.Count; i++)
                result += Convert.ToDouble(dgvBorrwDetail.Rows[i].Cells["Price"].Value);
            txtTotal.Text = result.ToString() + "R";
            txtReaders.Text = SQLDB.DB.Get1Record("select count([Reader Name]) [Readers] from(select [Reader Name] from v_BorrowD where Status = 1 group by [Reader Name]) as GG");
            if (txtReaders.Text == "" || txtReaders.Text == null)
                txtReaders.Text = "0";
        }

        private void rdoReturned_CheckedChanged(object sender, EventArgs e)
        {
            SQLDB.DB.SQL_Grid(dgvBorrwDetail, "SELECT * FROM v_BorrowD where Status = 0");
            this.MaximizeBox = false;
            dgvBorrwDetail.Columns["Status"].Visible = false;
            dgvBorrwDetail.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            double result = 0;
            for (int i = 0; i < dgvBorrwDetail.Rows.Count; i++)
                result += Convert.ToDouble(dgvBorrwDetail.Rows[i].Cells["Price"].Value);
            txtTotal.Text = result.ToString() + "R";
            txtReaders.Text = SQLDB.DB.Get1Record("select count([Reader Name]) [Readers] from(select [Reader Name] from v_BorrowD where Status = 0 group by [Reader Name]) as GG");
            if (txtReaders.Text == "" || txtReaders.Text == null)
                txtReaders.Text = "0";
        }

        private void rdoAll_CheckedChanged(object sender, EventArgs e)
        {
            SQLDB.DB.SQL_Grid(dgvBorrwDetail, "SELECT * FROM v_BorrowD");
            this.MaximizeBox = false;
            dgvBorrwDetail.Columns["Status"].Visible = false;
            dgvBorrwDetail.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            double result = 0;
            for (int i = 0; i < dgvBorrwDetail.Rows.Count; i++)
                result += Convert.ToDouble(dgvBorrwDetail.Rows[i].Cells["Price"].Value);
            txtTotal.Text = result.ToString() + "R";
            txtReaders.Text = SQLDB.DB.Get1Record("select count([Reader Name]) [Readers] from(select [Reader Name] from v_BorrowD group by [Reader Name]) as GG");
            if (txtReaders.Text == "" || txtReaders.Text == null)
                txtReaders.Text = "0";
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {

            SQLDB.DB.SQL_Grid(dgvBorrwDetail, "SELECT * FROM v_BorrowD");
            this.MaximizeBox = false;
            dgvBorrwDetail.Columns["Status"].Visible = false;
            dgvBorrwDetail.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            double result = 0;
            for (int i = 0; i < dgvBorrwDetail.Rows.Count; i++)
                result += Convert.ToDouble(dgvBorrwDetail.Rows[i].Cells["Price"].Value);
            txtTotal.Text = result.ToString() + "R";
            txtReaders.Text = SQLDB.DB.Get1Record("select count([Reader Name]) [Readers] from(select [Reader Name] from v_BorrowD group by [Reader Name]) as GG");
            if (txtReaders.Text == "" || txtReaders.Text == null)
                txtReaders.Text = "0";
        }

        private void dgvBorrwDetail_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dgvBorrwDetail.CurrentRow.Cells["Borrow ID"].Value.ToString();
            frmMoreDetail frm = new frmMoreDetail(id);
            frm.ShowDialog();
        }
    }
}
