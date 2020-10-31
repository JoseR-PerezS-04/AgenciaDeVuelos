<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11" runat="server">
<title>Ost Magazine</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <meta name="viewport" content="width=device-width" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="../../Resources/template/styles/layout.css" type="text/css" />
<script type="text/javascript" src="../../Resources/template/scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="../../Resources/template/scripts/jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="../../Resources/template/scripts/jquery.cycle.min.js"></script>
<script type="text/javascript" src="../../Resources/template/scripts/jquery.cycle.setup.js"></script>
</head>
<body id="top">
<div class="wrapper col0">
  <div id="topline">
    <ul>
      <li><a href="#">Libero</a></li>
      <li><a href="#">Maecenas</a></li>
      <li><a href="#">Mauris</a></li>
      <li class="last"><a href="#">Suspendisse</a></li>
    </ul>
    <div id="search">
      <form action="#" method="post">
        <fieldset>
          <legend>Site Search</legend>
          <input type="text" value="Search Our Website&hellip;"  onfocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;" />
          <input type="submit" name="go" id="go" value="Search" />
        </fieldset>
      </form>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
    <div id="topnav">
      <ul>
        <li class="last"><a href="#">Link text</a><span>Test Text Here</span></li>
        <li><a href="#">DropDown</a><span>Test Text Here</span>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
        <li><a href="#">Full Width</a><span>Test Text Here</span></li>
        <li><a href="#">Style Demo</a><span>Test Text Here</span></li>
        <li ><a href="#">Homepage</a><span>Test Text Here</span></li>
      </ul>
    </div>
    <div id="logo">
      <h1><a href="#">Bon Voyage</h1>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="featured_slide">
    <div class="featured_box">
      <div class="floater">
        <h2>1. Vuelos</h2>
        <p>Contamos con los aveadores mas profesionales.</p>
      </div>
      <img src="../../Resources/template/images/slider/imagen1.jpg" alt="" /> </div>
    <div class="featured_box">
      <div class="floater">
        <h2>2. Asientos</h2>
        <p>Disfrute de los mejores asientos, comodos y con una gran vista.</p>
      </div>
     
      <img src="../../Resources/template/images/slider/imagen2.jpg" alt="" /> </div>
    <div class="featured_box">
      <div class="floater">
        <h2>3. Aerolineas</h2>
        <p>Consta de las Aerolineas Mase seguras.</p>
      </div>
      <img src="../../Resources/template/images/slider/imagen3.jpg" alt="" /> </div>
    <div class="featured_box">
      <div class="floater">
        <h2>4. Mapas</h2>
        <p>Se especifica bien el lugar antes de dar a marcha.</p>
      </div>
      <img src="../../Resources/template/images/slider/imagen4.jpg" alt="" /> </div>
    <div class="featured_box">
      <div class="floater">
        <h2>5. Servicio</h2>
        <p>Le Garantisamos un exelente servicio para su comidad.</p>
      </div>
     <img src="../../Resources/template/images/slider/imagen5.jpg" alt="" /> </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div class="container">
    <div class="content">
      <div id="topstory">
        <h2>Feugiatrutrum rhoncus semper</h2>

        <ul>
          <li><img src="../../Resources/template/images/demo/190x130.gif" alt="" />
            <p>Nullamlacus dui ipsum conseqlo borttis non euisque morbipen a sdapibulum orna.</p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et.</p>
            <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
          </li>
          <li><img src="../../Resources/template/images/demo/190x130.gif" alt="" />
            <p>Nullamlacus dui ipsum conseqlo borttis non euisque morbipen a sdapibulum orna.</p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et.</p>
            <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
          </li>
          <li class="last"><img src="../../Resources/template/images/demo/190x130.gif" alt="" />
            <p>Nullamlacus dui ipsum conseqlo borttis non euisque morbipen a sdapibulum orna.</p>
            <p>Urnau ltrices quis curabitur pha sellent esque congue magnisve stib ulum quismodo nulla et.</p>
            <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
          </li>
        </ul>
        <br class="clear" />
      </div>
      <div id="latestnews">
        <h2>Feugiatrutrum rhoncus semper</h2>
        <ul>
          <li>
            <div class="imgholder"><img src="../../Resources/template/images/demo/imgl.gif" alt="" /></div>
            <div class="latestnews">
              <h2>About This Template !</h2>
              <p>This is a W3C standards compliant free website template from <a href="http://www.os-templates.com/">OS Templates</a>. This template is distributed using a <a href="http://www.os-templates.com/template-terms">Website Template Licence</a>, which allows you to use and modify the template for both personal and commercial use when you keep the provided credit links in the footer. For more CSS templates visit <a href="http://www.os-templates.com/">Free Website Templates</a>.</p>
              <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
            </div>
            <br class="clear" />
          </li>
          <li class="last">
            <div class="imgholder"><img src="../../Resources/template/images/demo/imgl.gif" alt="" /></div>
            <div class="latestnews">
              <h2>Indonectetus facilis leo nibh</h2>
              <p>Attincidunt vel nam a maurisus lacinia consectetus magnisl sed ac morbi. Inmaurisus habitur pretium eu et ac vest penatibus id lacus parturpis. Maecenaset adipiscinia tellentum nullam velit et a convallis curabitae vitae laoreet niseros ligula sem sed susp en at.</p>
              <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
            </div>
            <br class="clear" />
          </li>
        </ul>
      </div>
    </div>
    <div class="column">
      <div class="sponsors">
        <h2>Site Sponsors</h2>
        <div class="b_250"><a href="#"><img src="../../Resources/template/images/demo/250x250.gif" alt="" /></a></div>
        <div class="b_125">
          <ul>
            <li><a href="#"><img src="../../Resources/template/images/demo/125x125.gif" alt="" /></a></li>
            <li><a href="#"><img src="../../Resources/template/images/demo/125x125.gif" alt="" /></a></li>
            <li><a href="#"><img src="../../Resources/template/images/demo/125x125.gif" alt="" /></a></li>
            <li><a href="#"><img src="../../Resources/template/images/demo/125x125.gif" alt="" /></a></li>
            <li><a href="#"><img src="../../Resources/template/images/demo/125x125.gif" alt="" /></a></li>
            <li class="last"><a href="#"><img src="images/demo/125x125.gif" alt="" /></a></li>
          </ul>
          <div class="clear"></div>
        </div>
      </div>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="footer">
    <div class="box1">
      <h2>A Little Company Information !</h2>
      <img class="imgl" src="../../Resources/template/images/demo/imgl.gif" alt="" />
      <p>Morbitincidunt maurisque eros molest nunc anteget sed vel lacus mus semper. Anterdumnullam interdum eros dui urna consequam ac nisl nullam ligula vestassa. Condimentumfelis et amet tellent quisquet a leo lacus nec augue</p>
      <p>Portortornec condimenterdum eget consectetuer condis.</p>
    </div>
    <div class="box contactdetails">
      <h2>Our Contact Details !</h2>
      <ul>
        <li>Company Name</li>
        <li>Street Name &amp; Number</li>
        <li>Town</li>
        <li>Postcode/Zip</li>
        <li>Tel: xxxxx xxxxxxxxxx</li>
        <li>Fax: xxxxx xxxxxxxxxx</li>
        <li>Email: info@domain.com</li>
        <li class="last">LinkedIn: <a href="#">Company Profile</a></li>
      </ul>
    </div>
    <div class="box flickrbox">
      <h2>Latest Flickr Images !</h2>
      <div class="wrap">
        <div class="fix"></div>
        <div class="flickr_badge_image" id="flickr_badge_image1"><a href="#"><img src="../../Resources/template/images/demo/80x80.gif" alt="" /></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image2"><a href="#"><img src="../../Resources/template/images/demo/80x80.gif" alt="" /></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image3"><a href="#"><img src="../../Resources/template/images/demo/80x80.gif" alt="" /></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image4"><a href="#"><img src="../../Resources/template/images/demo/80x80.gif" alt="" /></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image5"><a href="#"><img src="../../Resources/template/images/demo/80x80.gif" alt="" /></a></div>
        <div class="flickr_badge_image" id="flickr_badge_image6"><a href="#"><img src="../../Resources/template/images/demo/80x80.gif" alt="" /></a></div>
        <div class="fix"></div>
      </div>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2011 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
    <br class="clear" />
  </div>
</div>
</body>
</html>