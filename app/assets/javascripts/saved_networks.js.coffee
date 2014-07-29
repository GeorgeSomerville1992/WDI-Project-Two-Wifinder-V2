$ ->
  # Hover Actions for Navbar
  $("li").hover (->
    $(this).addClass "active"
    return
  ), ->
    $(this).removeClass "active"
    return

  # Build Google Maps on Saved Networks Index
  x = document.getElementById "map"
  if x?
    style_array = [{"featureType":"water","stylers":[{"visibility":"on"},{"color":"#acbcc9"}]},{"featureType":"landscape","stylers":[{"color":"#f2e5d4"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#c5c6c6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#e4d7c6"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#fbfaf7"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#c5dac6"}]},{"featureType":"administrative","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"road"},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{},{"featureType":"road","stylers":[{"lightness":20}]}]
    handler = Gmaps.build 'Google'
    handler.buildMap provider: {maxZoom: 16, scrollwheel: false, styles: style_array}, internal: {id: 'map'}, ->
      markers = handler.addMarkers(gon.markers)
      markers_friends = handler.addMarkers(gon.friends_markers)
      all_markers = markers.concat markers_friends
      handler.bounds.extendWith(all_markers)
      handler.fitMapToBounds()

  # Geolocation
  codeLatLng = (lat, lng)->
    latlng = new google.maps.LatLng(lat, lng)
    geocoder = new google.maps.Geocoder();
    geocoder.geocode {latLng: latlng}, (results, status) ->

      if status is google.maps.GeocoderStatus.OK
        if results[1]
          $("#saved_network_address").val(results[1].formatted_address)
      else
        alert "Geocoder failed due to: #{status}"

  x = document.getElementById "new_saved_network"
  if x?
    getLocation = ->
        if (navigator.geolocation)
          navigator.geolocation.getCurrentPosition(showPosition)
        else
          alert "Geolocation is not supported by this browser."

    showPosition = (position) ->
        $("#saved_network_latitude").val(position.coords.latitude)
        $("#saved_network_longitude").val(position.coords.longitude)
        codeLatLng(position.coords.latitude, position.coords.longitude)
    getLocation()
