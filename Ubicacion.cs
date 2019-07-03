using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASPGoogleMapsZona
{
	public class Ubicacion
	{
		public double lat { get; set; }
		public double lng { get; set; }
		public Ubicacion()
		{

		}
		public static List<Ubicacion> fun1()
		{
			List<Ubicacion> ubicacions = new List<Ubicacion>();
			ubicacions.Add(new Ubicacion { lat= -0.31799710098656664, lng= -79.09074589843749 });
			ubicacions.Add(new Ubicacion { lat = -1.1968179403163848, lng = -78.82707402343749 });
			ubicacions.Add(new Ubicacion { lat = -0.9331918470655409, lng = -77.50871464843749 });
			ubicacions.Add(new Ubicacion { lat = -0.31799710098656664, lng = -79.09074589843749 });
			return ubicacions;
		}
	}
}