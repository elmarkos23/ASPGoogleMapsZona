using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPGoogleMapsZona
{
	public partial class _Default : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{

			}
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			Label1.Text = txtLatLng.Value.ToString();
		}
	}
}