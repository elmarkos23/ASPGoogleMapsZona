<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPGoogleMapsZona._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
			 <div id="map" class="well well-xs" style='width:100%; height:300px'></div>
                <asp:HiddenField ID="txtLat" runat="server" Value="-0.2298500" />
         <asp:HiddenField ID="txtLng" runat="server" Value="-78.5249500" />
         <asp:HiddenField ID="txtLatLng" runat="server" />

			<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>

    <%--api google maps--%>
      <script>
        <%--  function myMap() {
              var myCenter = new google.maps.LatLng(document.getElementById('<%=txtLat.ClientID%>').value, document.getElementById('<%=txtLng.ClientID%>').value);
            var mapCanvas = document.getElementById("map");
            var mapOptions = { center: myCenter, zoom: 17 };
            var map = new google.maps.Map(mapCanvas, mapOptions);
            var marker = new google.maps.Marker({ position: myCenter, draggable: true });
            marker.setMap(map);
            //Add listener
            google.maps.event.addListener(marker, "dragend", function (event) {
                document.getElementById('<%=txtLatLng.ClientID%>').value = this.position;
            }); //end addListener
				}--%>
				$(document).ready(function () {
    var map = new google.maps.Map(document.getElementById('map'), { center: new google.maps.LatLng(-0.2298500, -78.5249500), zoom: 6, mapTypeId: google.maps.MapTypeId.G_NORMAL_MAP , scaleControl: true });
    var isClosed = false;
    var poly = new google.maps.Polyline({ map: map, path: [], strokeColor: "#FF0000", strokeOpacity: 1.0, strokeWeight: 2 });
    google.maps.event.addListener(map, 'click', function (clickEvent) {
        if (isClosed)
            return;
        var markerIndex = poly.getPath().length;
        var isFirstMarker = markerIndex === 0;
        var marker = new google.maps.Marker({ map: map, position: clickEvent.latLng, draggable: true });
        if (isFirstMarker) {
            google.maps.event.addListener(marker, 'click', function () {
                if (isClosed)
                    return;
							var path = poly.getPath();
							  poly.setMap(null);
                poly = new google.maps.Polygon({ map: map, path: path, strokeColor: "#FF0000", strokeOpacity: 0.8, strokeWeight: 2, fillColor: "#FF0000", fillOpacity: 0.35 });
                isClosed = true;
            });
			}
			  google.maps.event.addListener(marker, 'drag', function (dragEvent) {
            poly.getPath().setAt(markerIndex, dragEvent.latLng);
        });
			poly.getPath().push(clickEvent.latLng);
		//	window.alert(clickEvent.latLng);
			document.getElementById('<%=txtLatLng.ClientID%>').value = document.getElementById('<%=txtLatLng.ClientID%>').value + clickEvent.latLng;
    });
});
</script>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAr5k-FIkVVTSqaVF5cKIDjxtequTAuykE&callback=myMap"></script>
    </div>


</asp:Content>
