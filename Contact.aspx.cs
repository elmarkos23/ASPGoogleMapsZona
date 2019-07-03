using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPGoogleMapsZona
{
	public partial class Contact : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{

			}
		}

		protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (DropDownList1.SelectedValue == "1")
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "invoca1", "funMapa();", true);
			}
			else if (DropDownList1.SelectedValue == "2")
			{
				ScriptManager.RegisterStartupScript(this, typeof(Page), "invoca2", "funAceptar();", true);
			}
			else if (DropDownList1.SelectedValue == "3")
			{
				//string json = JsonConvert.SerializeObject(Ubicacion.fun1());
				string json = "[{lat:1.2419625899232738,lng:-78.84080693359374},{ lat: -6.60805277640326,lng: -80.17977802731116},{ lat: -1.3491890164613978,lng: -75.25790302731116},{ lat: 1.2419625899232738,lng: -78.84080693359374}]; ";
				txtLatLng.Value = json;
				ScriptManager.RegisterStartupScript(this, typeof(Page), "invoca33", "funValores();", true);
				ScriptManager.RegisterStartupScript(this, typeof(Page), "invoca3", "funMapaData();", true);
			}
		}
	}
}