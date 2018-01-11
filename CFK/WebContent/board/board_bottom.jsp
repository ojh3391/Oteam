<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">	
	</head>
	<body>
	
	<!-- Footer section start -->
        <div class="footer">
            <p>&copy; 2017 Theme by <a href="http://www.graphberry.com">Oh!Bro~ Corp.</a></p>
        </div>
        
        <!-- ScrollUp button start -->
        <div class="scrollup">
            <a href="#">
                <i class="icon-up-open"></i>
            </a>
        </div>
        
        <!-- Include javascript -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
		<script type="text/javascript" src="./js/video-hover.js"></script>
        <script src="./Resources/js/jquery.js"></script>
        <script src="./Resources/js/jquery.popVideo.js"></script>
        <script type="text/javascript" src="./Resources/js/jquery.mixitup.js"></script>
        <script type="text/javascript" src="./Resources/js/bootstrap.js"></script>
        <script type="text/javascript" src="./Resources/js/modernizr.custom.js"></script>
        <script type="text/javascript" src="./Resources/js/jquery.bxslider.js"></script>
        <script type="text/javascript" src="./Resources/js/jquery.cslider.js"></script>
        <script type="text/javascript" src="./Resources/js/jquery.placeholder.js"></script>
        <script type="text/javascript" src="./Resources/js/jquery.inview.js"></script>
        <script type="text/javascript" src="./Resources/js/app.js"></script>
        <script>
   			$('#video').on('mouseenter',function() {
        		$('#video').popVideo({
            	playOnOpen: true,
            	title: "jQueryScript.net Demo Page",
          		closeOnEnd: true,
            	pauseOnClose: true,
        		}).open()
    		});
		</script>
		
    </body>
</html>