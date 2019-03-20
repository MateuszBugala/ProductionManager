<header>
    <!-- Navbar -->
    <div class="w3-top">
        <div class="w3-bar w3-theme-d2 w3-left-align">
            <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2"
               href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
            <a href="#" class="w3-bar-item w3-button w3-teal"><i class="fa fa-home w3-margin-right"></i>Main menu</a>
            <%--<a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Quotations</a>--%>
            <div class="w3-dropdown-hover w3-hide-small">
                <button class="w3-button" title="Notifications">Quotations<i class="fa fa-caret-down"></i></button>
                <div class="w3-dropdown-content w3-card-4 w3-bar-block">
                    <a href="#" class="w3-bar-item w3-button">Show all</a>
                    <a href="#" class="w3-bar-item w3-button">Add new</a>
                </div>
            </div>

            <div class="w3-dropdown-hover w3-hide-small">
                <button class="w3-button" title="Notifications">Products<i class="fa fa-caret-down"></i></button>
                <div class="w3-dropdown-content w3-card-4 w3-bar-block">
                    <a href="#" class="w3-bar-item w3-button">Show all</a>
                    <a href="#" class="w3-bar-item w3-button">Add new</a>
                    <a href="#" class="w3-bar-item w3-button">Product colors</a>
                    <a href="#" class="w3-bar-item w3-button">Product materials</a>
                    <a href="#" class="w3-bar-item w3-button">Product groups</a>
                </div>
            </div>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal" title="my-account">My account</a>
        </div>

        <!-- Navbar on small screens -->
        <div id="nav" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
            <a href="#" class="w3-bar-item w3-button">Quotations</a>
            <a href="#" class="w3-bar-item w3-button">Products</a>
            <a href="#" class="w3-bar-item w3-button">My account</a>
        </div>

    </div>


    <script>
        // Script for side navigation
        function w3_open() {
            var x = document.getElementById("mySidebar");
            x.style.width = "300px";
            x.style.paddingTop = "10%";
            x.style.display = "block";
        }

        // Close side navigation
        function w3_close() {
            document.getElementById("mySidebar").style.display = "none";
        }

        // Used to toggle the menu on smaller screens when clicking on the menu button
        function openNav() {
            var x = document.getElementById("nav");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
        }
    </script>
</header>