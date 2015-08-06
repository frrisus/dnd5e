function roll_dice(sides) {
  var numdice = Number( $( '#numdice' ).val() );
  var advantage = $( '#dicebar input[name="adv"]:checked' ).val();
  var d1 = 0, d2 = 0, r1 = [], r2 = [];
  for (var i=0; i<numdice; i++) {
    var t1 = Math.ceil( Math.random() * sides );
    var t2 = Math.ceil( Math.random() * sides );
    r1[r1.length] = t1;
    r2[r2.length] = t2;
    d1 += t1;
    d2 += t2;
  }
  var s = '';
  var s1 = '&nbsp;Result: ' + d1;
  var s2 = '&nbsp;Result: ' + d2;
  //r1.sortNumbers().reverse();
  //r2.sortNumbers().reverse();
  if (numdice > 1) {
    s1 += '&nbsp;&nbsp;(' + r1.join(",") + ')';
    s2 += '&nbsp;&nbsp;(' + r2.join(",") + ')';
  }
  s1 += '&nbsp;';
  s2 += '&nbsp;';
  if (advantage === "1") { 
    if (d2 > d1) {
      s = '<strike>' + s1 + '</strike>' + '<br/>' + s2;
    } else {
      s = s1 + '<br/>' + '<strike>' + s2 + '</strike>';
    }
  } else if (advantage === "-1") { 
    if (d2 < d1) {
      s = '<strike>' + s1 + '</strike>' + '<br/>' + s2;
    } else {
      s = s1 + '<br/>' + '<strike>' + s2 + '</strike>';
    }
  } else { s = s1; }
  $('#dicebar-result').html(s);
}

function roll_shadowrun() {
  var numdice = Number( $( '#numdice' ).val() );
  var r = [];
  var hits = 0, misses = 0;
  for (var i=0; i<numdice; i++) {
    var t = Math.ceil( Math.random() * 6 );
    r[r.length] = t;
  }
  var s = '';
  $('#dicebar-result').html('&nbsp;Result: ');
  for (var i=0; i<numdice; i++) {
    var $x = $('<span class="roll">');
    if (r[i] >= 5) { $x.addClass('hit'); hits++; }
    if (r[i] == 1) { $x.addClass('glitch'); misses++; }
    $x.html(r[i]);
    $('#dicebar-result').append($x);
  }
  var s2 = '&nbsp;&nbsp;(' + hits + ' hit';
  if (hits != 1) { s2 += 's'; }
  if (misses > numdice/2) { 
    if (hits === 0) {
      s2 = '&nbsp;&nbsp;(<span class="glitch" style="font-weight: bold">critical glitch</span>'; 
    } else {
      s2 += ', <span class="glitch">glitch</span>'; 
    }
  }
  s2 += ')';
  $('#dicebar-result').append(s2);
}

$( function () {
  $( '#roll-4' ).on( 'click', function () { roll_dice(4); } );
  $( '#roll-6' ).on( 'click', function () { roll_dice(6); } );
  $( '#roll-8' ).on( 'click', function () { roll_dice(8); } );
  $( '#roll-10' ).on( 'click', function () { roll_dice(10); } );
  $( '#roll-12' ).on( 'click', function () { roll_dice(12); } );
  $( '#roll-20' ).on( 'click', function () { roll_dice(20); } );
  $( '#roll-sr' ).on( 'click', function () { roll_shadowrun(); } );

  $( '#numdice-minone' ).on( 'click', function () {
    var nd = Number( $( '#numdice' ).val() );
    nd = nd - 1;
    if (nd < 1) { nd = 1; }
    $( '#numdice' ).val(nd);
  } );
  $( '#numdice-plsone' ).on( 'click', function () {
    var nd = Number( $( '#numdice' ).val() );
    nd = nd + 1;
    $( '#numdice' ).val(nd);
  } );
});
