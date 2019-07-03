<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ASPGoogleMapsZona.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<h2><%: Title %>.</h2>

	  <asp:HiddenField ID="txtLatLng" runat="server" />

	<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control">
		<asp:ListItem Text="Seleccione" Value="0"></asp:ListItem>
		<asp:ListItem Text="Lugar 1" Value="1"></asp:ListItem>
		<asp:ListItem Text="Lugar 2" Value="2"></asp:ListItem>
		<asp:ListItem Text="Lugar 3" Value="3"></asp:ListItem>
	</asp:DropDownList>
	<hr />
	<div id="mapa" class="well well-xs" style='width: 100%; height: 300px'></div>
	<script lang="javascript" type="text/javascript">
		function funValores()
		{
			var x = document.getElementById('<%= txtLatLng.ClientID %>').value;
				alert(x);
		}
		function funAceptar() {
			alert('El Contenido del TextBox es: Seleccione');
		}
		function funMapa() {
			var map = new google.maps.Map(document.getElementById('mapa'), {
				zoom: 5,
				center: { lat: -0.31799710098656664, lng: -79.09074589843749},
				mapTypeId: 'terrain'
			});

			var triangleCoords = [{lat:1.2419625899232738,lng:-78.84080693359374},
					{lat:-6.60805277640326,lng:-80.17977802731116},
					{lat:-1.3491890164613978,lng:-75.25790302731116},
					{lat:1.2419625899232738,lng:-78.84080693359374}];

			// Construct the polygon.
			var bermudaTriangle = new google.maps.Polygon({
				paths: triangleCoords,
				strokeColor: '#FF0000',
				strokeOpacity: 0.8,
				strokeWeight: 2,
				fillColor: '#FF0000',
				fillOpacity: 0.35
			});
			bermudaTriangle.setMap(map);
			alert('El Contenido de Mapa');
		}
		function funMapaData() {
			var map = new google.maps.Map(document.getElementById('mapa'), {
				zoom: 5,
				center: { lat: -0.31799710098656664, lng: -79.09074589843749 },
				mapTypeId: 'terrain'
			});

			// Define the LatLng coordinates for the polygon's path.
			var obj = JSON.parse(document.getElementById('<%=txtLatLng.ClientID%>').value);
			//var obj = document.getElementById('<%=txtLatLng.ClientID%>').value;
			console.log(obj);
			var ubicacion = obj;

			// Construct the polygon.
			var myzona = new google.maps.Polygon({
				paths: ubicacion,
				strokeColor: '#FF0000',
				strokeOpacity: 0.8,
				strokeWeight: 2,
				fillColor: '#FF0000',
				fillOpacity: 0.35
			});
			myzona.setMap(map);
			alert('El Contenido de MapaData');
		}
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAr5k-FIkVVTSqaVF5cKIDjxtequTAuykE&callback=myMap"></script>

</asp:Content>
