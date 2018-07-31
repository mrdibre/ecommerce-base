<!doctype html>
<html lang="pt-BR" class="no-js no-svg">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="{{ seo.description }}">
    <meta name="keywords" content="{{ seo.keywords }}">
    <meta name="tags" content="{{ seo.tags }}">

    <script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>
    <script>window._wca = window._wca || [];</script>
    <script type='text/javascript' src='{{ url.getStatic() }}js/jquery.js'></script>
    <script type='text/javascript' src='{{ url.getStatic() }}js/jquery-migrate.js'></script>
    <script async src='{{ url.getStatic() }}js/stats.js'></script>

    <title>{{ seo.title }}</title>

    <link rel='stylesheet' id='wp-core-blocks-theme-css'  href='{{ url.getStatic() }}css/core-theme.css' type='text/css' media='all' />
    <link rel='stylesheet' id='wp-core-blocks-css'  href='{{ url.getStatic() }}css/core-style.css' type='text/css' media='all' />
    <link rel='stylesheet' id='brands-styles-css'  href='{{ url.getStatic() }}css/brands.css' type='text/css' media='all' />
    <link rel='stylesheet' id='swatches-and-photos-css'  href='{{ url.getStatic() }}css/photos.css' type='text/css' media='all' />
    <link rel='stylesheet' id='conj-google-font-css'  href='https://fonts.googleapis.com/css?family=Rubik%3A100%2C300%2C400%7CMontserrat%3A100%2C300%2C400%2C500%2C700%2C900&#038;subset=latin%2Clatin-ext' type='text/css' media='all' />
    <link rel='stylesheet' id='feather-css'  href='{{ url.getStatic() }}css/feather.css' type='text/css' media='all' />
    <link rel='stylesheet' id='js-offcanvas-css'  href='{{ url.getStatic() }}css/offcanvas.css' type='text/css' media='all' />
    <link rel='stylesheet' id='slinky-css'  href='{{ url.getStatic() }}css/slinky.css' type='text/css' media='all' />
    <link rel='stylesheet' id='iziToast-css'  href='{{ url.getStatic() }}css/izitoast.css' type='text/css' media='all' />
    <link rel='stylesheet' id='flickity-css'  href='{{ url.getStatic() }}css/flickity.css' type='text/css' media='all' />
    <link rel='stylesheet' id='conj-styles-css'  href='{{ url.getStatic() }}css/style.min.css' type='text/css' media='all' />
    <link rel="stylesheet" href="{{ url.getStatic() }}css/style.min.css">
    <link rel='stylesheet' id='conj-jetpack-style-css'  href='{{ url.getStatic() }}css/jetpack.min.css' type='text/css' media='all' />
    <link rel='stylesheet' id='conj-woocommerce-styles-css'  href='{{ url.getStatic() }}css/woocommerce.css' type='text/css' media='all' />
    <link rel='stylesheet' id='jetpack-widget-social-icons-styles-css'  href='{{ url.getStatic() }}css/jetpack-social-icons.css' type='text/css' media='all' />
    <link rel='stylesheet' id='jetpack_css-css'  href='{{ url.getStatic() }}css/jetpack6-2.css' type='text/css' media='all' />
    <link rel="canonical" href="https://udipop.com.br/" />
    <link rel="icon" href="{{ url.getStatic() }}icons/logo.png"/>

    <style id='conj-woocommerce-styles-inline-css' type='text/css'>
        @font-face {
            font-family: "star";
            src: url("https://mk0conjrri8axjmrl.kinstacdn.com/wp-content/plugins/woocommerce/assets/fonts/star.eot");
            src: url("https://mk0conjrri8axjmrl.kinstacdn.com/wp-content/plugins/woocommerce/assets/fonts/star.eot?#iefix") format("embedded-opentype"),
            url("https://mk0conjrri8axjmrl.kinstacdn.com/wp-content/plugins/woocommerce/assets/fonts/star.woff") format("woff"),
            url("https://mk0conjrri8axjmrl.kinstacdn.com/wp-content/plugins/woocommerce/assets/fonts/star.ttf") format("truetype"),
            url("https://www.conj.ws/electronic-store/wp-content/plugins/woocommerce/assets/fonts/star.svg#star") format("svg");
            font-weight: normal;
            font-style: normal;
        }
    </style>
    <style id='woocommerce-inline-inline-css' type='text/css'>
        .woocommerce form .form-row .required { visibility: visible; }
    </style>
    <style id='conj-styles-inline-css' type='text/css'>
        h1,h2,h3,h4,h5,h6,.widget-title,.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .product-category .meta p,.conj-homepage-template .conj-wc-product-reviews .review-item .meta p>a,.conj-homepage-template .conj-wc-shop-by-category__layout-card-view .meta p:first-child,.conj-homepage-template .conj-wc-shop-by-category__layout-block-view .product-category .meta p,.conj-homepage-template .conj-services .meta>span:first-of-type,.site-branding .site-title{font-family:'Rubik',sans-serif}body,p{font-family:'Montserrat',sans-serif}button,input,select,optgroup,textarea{font-family:'Rubik',sans-serif}.site-branding .site-description,.site-branding .site-title a{color:#6b6f81}body{background-color:#f4f5fa}body.search-results article .entry-footer a,body.search-results article .entry-title a,body:not(.single-post) article.post.hentry:not(.conj-blog-post__loop) .entry-header a,.comment-meta .comment-author .fn,.comment-respond .comment-reply-title,.comment-respond #reply-title,.main-navigation .widget_calendar .calendar_wrap caption,#secondary .widget_calendar .calendar_wrap caption,#secondary.widget-area .widget-title>a,#secondary.widget-area .widget-title,dd,h1,h2,h3,h4,h5,h6{color:#464855}body.single-post article.post.hentry:not(.conj-blog-post__loop) .entry-footer .tags-links>a,article.post.hentry:not(.conj-blog-post__loop) .post-meta a,.single-post article.type-post .post-meta .byline a,.error-404-first .widget_recent_entries a,.conjmm-row .widget_conj_social_media_icons_widget ul.pe-social a,#secondary .widget_conj_social_media_icons_widget ul.pe-social a,#secondary .widget_recent_entries a,#secondary .widget_pages ul a,#secondary .widget ul.menu li>a,#secondary .widget_meta a,.widget_categories a,#secondary .widget_archive a,.cart_totals .shipping label,.widget_mc4wp_form_widget button.feather-chevron-right:not(:hover):before,body{color:#6B6F81}.page-links a>.page-number,.site-main .comment-navigation .nav-links a,.post-navigation .nav-links a,.pagination .page-numbers:not(.current),article.post.hentry:not(.conj-blog-post__loop) .cat-tags-links .post-categories a,li.conjmm-active .conjmm-mega-menu .widget.widget_tag_cloud a,.widget_tag_cloud a,label,dt{color:#898d9f}.comment.byuser img.avatar,.comment-metadata a time,.comment-meta .comment-author .says,.calendar_wrap tfoot td a,.calendar_wrap thead tr th,.single-post article.type-post .post-meta .byline{color:#9da1b3}body.search-results article .entry-footer a:hover,body.search-results article .entry-title a:hover,body.single-post article.post.hentry:not(.conj-blog-post__loop) .entry-footer .tags-links>a:hover,.single-post article.type-post .post-meta .byline a:hover,body:not(.single-post) article.post.hentry:not(.conj-blog-post__loop) .entry-header a:hover,article.post.hentry:not(.conj-blog-post__loop) .post-meta a:hover,.entry-footer .edit-link .post-edit-link,.page-links a>.page-number:hover,.site-main .comment-navigation a:hover,.post-navigation .nav-links a:hover,.pagination .page-numbers:not(.dots):hover,.pagination .page-numbers.current,.page-links .page-number,.comment-metadata a:hover time,.error-404-first .widget_recent_entries a:hover,#secondary .widget_recent_entries a:hover,#secondary .widget_categories .current-cat-parent>a,#secondary .widget_categories .current-cat>a,#secondary ul.menu .current_page_parent>a,#secondary ul.menu .current_page_item>a,#secondary .widget_pages .current_page_parent>a,#secondary .widget_pages .current_page_item>a,#secondary .widget_pages ul a:hover,#secondary .widget ul.menu li:hover>a,#secondary .widget_meta a abbr,#secondary .widget_meta a:hover,.widget_categories a:hover,.calendar_wrap tfoot td a:hover,#secondary .widget_archive a:hover,.primary-navigation>ul.menu .conjmm-mega-menu .widget_conj_promo_box_widget .promo-box>a:hover,.widget_conj_promo_box_widget .promo-box>a:hover,.site-branding .site-title a:hover,input[type='checkbox']:checked:before,.widget_mc4wp_form_widget button.feather-chevron-right:hover:before,a{color:#933693}.widget_conj_promo_box_widget .promo-box h3,.primary-navigation>ul.menu .conjmm-mega-menu .widget_conj_promo_box_widget .promo-box>a,.widget_conj_promo_box_widget .promo-box>a,a:hover{color:#414B92}blockquote{color:#6B6F81}select{background-image:linear-gradient(45deg,transparent 50%,#898EA2 50%),linear-gradient(135deg,#898EA2 50%,transparent 50%),linear-gradient(to right,transparent,transparent)}input[type='checkbox'],input[type='radio'],.widget form[role='search']:before,select,input[type='text'],input[type='email'],input[type='url'],input[type='password'],input[type='search'],input[type='number'],input[type='tel'],input[type='range'],input[type='date'],input[type='month'],input[type='week'],input[type='time'],input[type='datetime'],input[type='datetime-local'],input[type='color'],textarea{background-color:#FFF;color:#898EA2;border-color:#DDDFE7}mark,input[type='radio']:checked:before{background-color:#933693}textarea::-webkit-input-placeholder,input::-webkit-input-placeholder{color:#898EA2}textarea::-moz-placeholder,input::-moz-placeholder{color:#898EA2}textarea:-ms-input-placeholder,input:-ms-input-placeholder{color:#898EA2}textarea::-ms-input-placeholder,input::-ms-input-placeholder{color:#898EA2}textarea::placeholder,input::placeholder{color:#898EA2}textarea:-moz-placeholder,input:-moz-placeholder{color:#898EA2}select:focus,input[type='text']:focus,input[type='email']:focus,input[type='url']:focus,input[type='password']:focus,input[type='search']:focus,input[type='number']:focus,input[type='tel']:focus,input[type='range']:focus,input[type='date']:focus,input[type='month']:focus,input[type='week']:focus,input[type='time']:focus,input[type='datetime']:focus,input[type='datetime-local']:focus,input[type='color']:focus,textarea:focus{border-color:#898EA2}.comments-area .comments-title,.pagination .page-numbers.dots,.pagination .page-numbers:not(.current):not(:hover),.page-links a>.page-number:not(:hover),ol.comment-list .comment-meta,.comment-respond .comment-reply-title,.comment-respond #reply-title,td,th,blockquote,.wp-block-pullquote,.error-404-last .widgettitle,.error-404-first .widgettitle,.error-404-first .widget-title,.conjmm-row>div:not(:last-of-type),.conjmm-mega-menu .conjmm-row:not(:last-of-type),.conj-homepage-template .conj-section__button-edit,#secondary.widget-area .widget:not(:first-of-type),.site-footer .widget ul.menu .sub-menu,#secondary .widget ul.menu .sub-menu,.widget_pages ul ul.children,.widget_categories ul ul.children,.entry-footer .edit-link .post-edit-link{border-color:#DDDFE7}.site-footer .widget ul.menu .sub-menu li:before,#secondary .widget ul.menu .sub-menu li:before,.widget_pages ul.children>li:before,.widget_categories ul.children>li:before,.entry-footer .edit-link .post-edit-link,body.single-post article.post.hentry:not(.conj-blog-post__loop) .entry-footer .tags-links:before{background-color:#DDDFE7}body.single-post article.post.hentry:not(.conj-blog-post__loop) .entry-footer .tags-links>a:hover,article.post.hentry:not(.conj-blog-post__loop) .cat-tags-links .post-categories a:hover,body:not(.single-post) article.post.hentry:not(.conj-blog-post__loop) .entry-content .more-link,.wp-block-button__link:not(.has-text-color),.conjmm-row .widget_conj_social_media_icons_widget ul.pe-social a:hover,#secondary .widget_conj_social_media_icons_widget ul.pe-social a:hover,.widget_tag_cloud ul li:hover,.calendar_wrap #today,.button:not(.conj-section__button-edit):not(:focus):not(:active):not(:hover):not([disabled]):not([name='apply_coupon']),button:not(.flickity-prev-next-button):not(.close-btn):not(.handheld-menu-toggle):not(.pswp__button):not(:focus):not(:active):not(:hover):not([disabled]):not([name='apply_coupon']),input[type='button']:not(:focus):not(:active):not(:hover),input[type='reset']:not(:focus):not(:active):not(:hover),button[name='apply_coupon']:active,button[name='apply_coupon']:hover,button[name='apply_coupon']:focus,input[type='submit'][name='apply_coupon']:hover,input[type='submit'][name='apply_coupon']:focus,input[type='submit']:not([name='apply_coupon']):not(:focus):not(:active):not(:hover),.conj-homepage-template .entry-content p:last-of-type>a:only-child:not(:focus):not(:active):not(:hover){background-color:#933693}body:not(.single-post) article.post.hentry:not(.conj-blog-post__loop) .entry-content .more-link,.wp-block-button__link:not(.has-text-color),.button:not(.conj-section__button-edit):not(:focus):not(:active):not(:hover):not([disabled]):not([name='apply_coupon']),button:not(.flickity-prev-next-button):not(.close-btn):not(.handheld-menu-toggle):not(.pswp__button):not(:focus):not(:active):not(:hover):not([disabled]):not([name='apply_coupon']),input[type='button']:not(:focus):not(:active):not(:hover),input[type='reset']:not(:focus):not(:active):not(:hover),button[name='apply_coupon']:active,button[name='apply_coupon']:hover,button[name='apply_coupon']:focus,input[type='submit'][name='apply_coupon']:hover,input[type='submit'][name='apply_coupon']:focus,input[type='submit']:not([name='apply_coupon']):not(:focus):not(:active):not(:hover),.conj-homepage-template .entry-content p:last-of-type>a:only-child:not(:focus):not(:active):not(:hover){border-color:#933693}body.single-post article.post.hentry:not(.conj-blog-post__loop) .entry-footer .tags-links>a:hover,article.post.hentry:not(.conj-blog-post__loop) .cat-tags-links .post-categories a:hover,body:not(.single-post) article.post.hentry:not(.conj-blog-post__loop) .entry-content .more-link,.wp-block-button__link:not(.has-text-color),li.conjmm-active .conjmm-mega-menu .widget_conj_social_media_icons_widget ul.pe-social a:hover,#secondary .widget_conj_social_media_icons_widget ul.pe-social a:hover,li.conjmm-active .conjmm-mega-menu .widget.widget_tag_cloud li a:hover,li.conjmm-active .conjmm-mega-menu .widget.widget_tag_cloud li:hover a,.widget_tag_cloud ul li:hover a,li.conjmm-active .conjmm-mega-menu .widget.widget_calendar tbody td a,.widget_calendar .calendar_wrap tbody td>a,.calendar_wrap #today,.button:not(.conj-section__button-edit):not(:focus):not(:active):not(:hover):not([disabled]):not([name='apply_coupon']),button:not(.flickity-prev-next-button):not(.close-btn):not(.handheld-menu-toggle):not(.pswp__button):not(:focus):not(:active):not(:hover):not([disabled]):not([name='apply_coupon']),input[type='button']:not(:focus):not(:active):not(:hover),input[type='reset']:not(:focus):not(:active):not(:hover),button[name='apply_coupon']:active,button[name='apply_coupon']:hover,button[name='apply_coupon']:focus,input[type='submit'][name='apply_coupon']:hover,input[type='submit'][name='apply_coupon']:focus,input[type='submit']:not([name='apply_coupon']):not(:focus):not(:active):not(:hover),.conj-homepage-template .entry-content p:last-of-type>a:only-child:not(:focus):not(:active):not(:hover){color:#FFF}body:not(.single-post) article.post.hentry:not(.conj-blog-post__loop) .entry-content .more-link:hover,.wp-block-button__link:not(.has-text-color):active,.wp-block-button__link:not(.has-text-color):focus,.wp-block-button__link:not(.has-text-color):hover,li.conj-wc-product__layout-classic .added_to_cart,li.conj-wc-product__layout-list .added_to_cart,.button:not(.conj-section__button-edit):not([name='apply_coupon']):focus,.button[disabled],button[disabled],button:not(.flickity-prev-next-button):not(.close-btn):not(.handheld-menu-toggle):not(.pswp__button):not([name='apply_coupon']):focus,input[type='button']:focus,input[type='reset']:focus,button[name='apply_coupon']:not(:focus):not(:active):not(:hover),input[type='submit'][name='apply_coupon'],input[type='submit']:not([name='apply_coupon']):focus,.button:not(.conj-section__button-edit):not([name='apply_coupon']):active,button:not(.flickity-prev-next-button):not(.close-btn):not(.handheld-menu-toggle):not(.pswp__button):not([name='apply_coupon']):active,input[type='button']:active,input[type='reset']:active,input[type='submit']:not([name='apply_coupon']):active,.button:not(.conj-section__button-edit):not([name='apply_coupon']):hover,button:not(.flickity-prev-next-button):not(.close-btn):not(.handheld-menu-toggle):not(.pswp__button):not([name='apply_coupon']):hover,input[type='button']:hover,input[type='reset']:hover,input[type='submit']:not([name='apply_coupon']):hover,.conj-homepage-template .entry-content p:last-of-type>a:only-child:hover{color:#933693}body:not(.single-post) article.post.hentry:not(.conj-blog-post__loop) .entry-content .more-link:hover{border-color:#933693}.site-header:after{background-color:#FFF;opacity:1}.conj-secondary-widget-area__sticky{top:10px}body.admin-bar .conj-secondary-widget-area__sticky{top:42px}article.post.hentry:not(.conj-blog-post__loop).format-chat .entry-content>*:before,article.post.hentry:not(.conj-blog-post__loop),ol.comment-list .pingback:not(:last-child) .comment-body,ol.comment-list .comment .comment-body,.error-404-last .widget_tag_cloud ul li:not(:hover),#secondary .conj-secondary-widget-area__wrapper,#secondary.widget-area .widget-title>a,#secondary.widget-area .widget-title{background-color:#FFF}.widget_conj_promo_box_widget .promo-box h4{background-color:#414B92}.site-footer .mc4wp-form-fields button:not([class*='feather-']):hover{color:#FFF !important}.widget_conj_promo_box_widget .promo-box h4,mark{color:#FFF}.conjmm-mega-menu .widget:not(.widget_nav_menu) .widget-title:after{background-color:#464855}#secondary .calendar_wrap tfoot tr:not(:last-of-type) td,#secondary .calendar_wrap tbody tr:not(:last-of-type) td,#secondary .calendar_wrap td{border-color:#FFF}.widget_calendar .calendar_wrap tbody td>a{background-color:#98a0ff}#masthead{border-color:#eff0f5}#site-navigation>div.menu>ul>li>a,.primary-navigation>ul.menu>.menu-item>a,.secondary-navigation ul.menu>li.menu-item-has-children>a:after{color:#6B6F81}.primary-navigation ul.menu>li.menu-item-has-children>a:after,#masthead .social-navigation ul.menu a{color:#898d9f}.handheld-menu-toggle,.secondary-navigation ul.menu>.menu-item>a{color:#434759}.primary-navigation>ul.menu>li.menu-item-has-children.current_page_parent>a:after,.primary-navigation>ul.menu>li.menu-item-has-children.current-menu-parent>a:after,.primary-navigation>ul.menu>li.menu-item-has-children.current-menu-item>a:after,#site-navigation>div.menu>ul .current_page_item>a,#site-navigation>div.menu>ul .current_page_parent>a,.primary-navigation>ul.menu>.current-menu-item>a,.primary-navigation>ul.menu>.current-menu-parent>a,.primary-navigation>ul.menu>.current_page_parent>a,.secondary-navigation ul.menu>li.menu-item-has-children.current_page_parent>a:after,.secondary-navigation ul.menu>li.menu-item-has-children.current-menu-parent>a:after,.secondary-navigation ul.menu>li.menu-item-has-children.current-menu-item>a:after,.secondary-navigation ul.menu>.current-menu-item>a,.secondary-navigation ul.menu>.current-menu-parent>a,.secondary-navigation ul.menu>.current_page_parent>a,.handheld-menu-toggle:hover,.c-offcanvas-content-wrap--overlay .handheld-menu-toggle,.primary-navigation ul.menu>li.menu-item-has-children:hover>a:after,.secondary-navigation ul.menu>li.menu-item-has-children:hover>a:after,.secondary-navigation ul.menu>.menu-item:hover>a,#site-navigation>div.menu>ul>li.current_page_ancestor>a,#site-navigation>div.menu>ul>li:hover>a,.primary-navigation>ul.menu>.menu-item:hover>a,#masthead .social-navigation ul.menu a:hover{color:#8A91FF}#site-navigation>div.menu>ul ul.children:before,#site-navigation>div.menu>ul ul.children,#masthead ul.sub-menu>li>ul.sub-menu:before,#masthead ul.menu>li.menu-item-has-children>ul.sub-menu:before,#masthead ul.sub-menu{background-color:#FFF;border-color:#f4f5fa}li.conjmm-active .conjmm-mega-menu .widget a,#site-navigation>div.menu>ul ul.children>li>a,li.conjmm-active .widget.widget_nav_menu li.menu-item>a,#masthead ul.sub-menu>li>a{color:#6B6F81}#site-navigation>div.menu>ul ul.children>li.current_page_ancestor>a,#site-navigation>div.menu>ul ul.children>li.current_page_item>a,#site-navigation>div.menu>ul ul.children>li:hover>a,#masthead ul.sub-menu .current-menu-item>a,#masthead ul.sub-menu .current-menu-parent>a,#masthead ul.sub-menu .current-menu-ancestor>a,#masthead ul.sub-menu .current_page_parent>a,#masthead ul.sub-menu .current_page_item>a,li.conjmm-active .conjmm-mega-menu .widget_categories .current-cat-parent>a,li.conjmm-active .conjmm-mega-menu .widget_categories .current-cat>a,li.conjmm-active .conjmm-mega-menu .widget_pages .current_page_parent>a,li.conjmm-active .conjmm-mega-menu .widget_pages .current_page_item>a,li.conjmm-active .conjmm-mega-menu .widget a:hover,li.conjmm-active .widget.widget_nav_menu li.menu-item:hover>a,li.conjmm-active .widget.widget_nav_menu .widget-title,#masthead ul.sub-menu>li:hover>a{color:#933693}.c-offcanvas-content-wrap,article.post.hentry:not(.conj-blog-post__loop) .cat-tags-links .post-categories a,.entry-footer .edit-link .post-edit-link,.site-footer .widget_mc4wp_form_widget input[type='email'],.conjmm-row .widget_conj_social_media_icons_widget ul.pe-social a,#secondary .widget_conj_social_media_icons_widget ul.pe-social a,.conjmm-row .widget_contact_info>div>div:before,.conjmm-row .widget_conj_contact_info_widget>div>div:before,#secondary .widget_contact_info>div>div:before,#secondary .widget_conj_contact_info_widget>div>div:before,.widget_tag_cloud ul li,.site-top-bar:after{background-color:#f4f5fa}.hamburger-nav-icon .icon-bar{background-color:#434759}.handheld-menu-toggle:hover .hamburger-nav-icon .icon-bar,.c-offcanvas-content-wrap--overlay .hamburger-nav-icon .icon-bar{background-color:#8A91FF}.slinky-theme-default .back::before,.slinky-theme-default .next::after{color:#FFF}.conjmm-mega-menu .calendar_wrap tfoot tr:not(:last-of-type) td,.conjmm-mega-menu .calendar_wrap tbody tr:not(:last-of-type) td,.conjmm-mega-menu .calendar_wrap td{border-color:#FFF}.c-offcanvas,.slinky-menu>ul,.c-offcanvas.is-open{background-color:#3A3C4B}.handheld-offcanvas .close-btn,.slinky-menu.slinky-theme-default>ul a{color:#FFF}.slinky-menu .header .title,.slinky-menu>ul a:hover{color:#A7ABBD}.handheld-offcanvas .close-btn:hover{color:#8A91FF}#handheld-slinky-menu .current-menu-ancestor>a:before,#handheld-slinky-menu .current_page_ancestor>a:before,#handheld-slinky-menu .current-menu-item>a:before,#handheld-slinky-menu .current-menu-parent>a:before,#handheld-slinky-menu .current_page_item>a:before{background-color:#8A91FF}article.conj-blog-post__loop a,article.conj-blog-post__loop{color:#FFF}article.conj-blog-post__loop:after{opacity:0.7;background-image:-webkit-linear-gradient(125deg,#acb4ff,#933693);background-image:-o-linear-gradient(125deg,#acb4ff,#933693);background-image:linear-gradient(325deg,#acb4ff,#933693)}article.post.hentry:not(.conj-blog-post__loop).format-chat .entry-content>*:nth-child(even),article.post.hentry:not(.conj-blog-post__loop).format-chat .entry-content>*:nth-child(even):before{border-color:#933693}.site-footer{background-color:#353745;background-image:url(https://i1.wp.com/www.conj.ws/electronic-store/wp-content/uploads/sites/2/2018/06/footer-bg.png?fit=1920%2C286&#038;ssl=1);background-repeat:no-repeat;background-size:auto;background-position:center bottom;margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:56px;padding-right:0;padding-bottom:28px;padding-left:0}.site-footer>.col-full{min-height:4em}.app-market-download-buttons a>span:first-child,.site-footer,.site-footer .woocommerce-mini-cart__total>strong{color:#A5A8BB}.app-market-download-buttons a{border-color:#A5A8BB}.footer-widgets.row-2{border-color:#696c7f}.site-footer .widget_product_categories .product-categories li a,.site-footer .woocommerce.widget_rating_filter li a,.site-footer .wc-brand-list-layered-nav-product_brand a,.site-footer .woocommerce-mini-cart-item a,.site-footer a{color:#A5A8BB}.site-footer .widget_product_categories .product-categories li a:hover,.site-footer .woocommerce.widget_rating_filter li a:hover,.site-footer .wc-brand-list-layered-nav-product_brand a:hover,.site-footer .woocommerce-mini-cart-item a:hover,.site-footer .widget_categories .current-cat-parent>a,.site-footer .widget_categories .current-cat>a,.site-footer ul.menu .current_page_parent>a,.site-footer ul.menu .current_page_item>a,.site-footer ul.menu .current-menu-item>a,.site-footer .widget_pages .current_page_parent>a,.site-footer .widget_pages .current_page_item>a,.site-footer a:focus,.site-footer a:active,.site-footer a:hover{color:#8A91FF}.site-footer .widget-title{border-color:#8A91FF}.site-footer .widget_conj_social_media_icons_widget ul.pe-social a:hover{background-color:#8A91FF;color:#fff}.app-market-download-buttons a>span:last-child,.site-footer h1,.site-footer h2,.site-footer h3,.site-footer h4,.site-footer h5,.site-footer h6,.site-footer .widget_calendar .calendar_wrap caption,.site-footer .widget-title{color:#F4F5FA}.site-footer .widget_conj_social_media_icons_widget ul.pe-social a,.site-footer .confit-hours:before,.site-footer .confit-email:before,.site-footer .confit-phone:before,.site-footer .confit-address:before{background-color:#3a3c4a}.site-footer .calendar_wrap tfoot tr:not(:last-of-type) td,.site-footer .calendar_wrap tbody tr:not(:last-of-type) td,.site-footer .calendar_wrap td{border-color:#353745}code,pre,.required{color:#FF4961}code,pre{background-color:#e0e1e6}.comment-respond .comment-notes,p.no-comments{background-color:#1E9FF2}.comment-respond .comment-notes .required,.comment-respond .comment-notes,p.no-comments a,p.no-comments{color:#FFF !important}#secondary .widget_top-posts a,#secondary .widget_rss_links a,.widget_google_translate_widget .goog-te-gadget-simple,#secondary div[class^=gr_custom_author],#secondary .jetpack-display-remote-posts h4 a,#secondary .widget.widget_authors li>ul a{color:#6B6F81}#secondary .widget_top-posts a:hover,#secondary .widget_rss_links a:hover,#secondary div[class^=gr_custom_container] a,#secondary .jetpack-display-remote-posts h4 a:hover,#secondary .widget.widget_authors li>ul a:hover{color:#933693}#secondary div[class^=gr_custom_container] a:hover{color:#414B92}.entry-author{background-color:#FFF}.widget_google_translate_widget .goog-te-gadget-simple{background-image:linear-gradient(45deg,transparent 50%,#898EA2 50%),linear-gradient(135deg,#898EA2 50%,transparent 50%),linear-gradient(to right,rgba(255,255,255,0),rgba(255,255,255,0))}.widget_google_translate_widget .goog-te-gadget-simple,.widget_google_translate_widget .goog-te-gadget-simple a{background-color:#FFF;border-color:#DDDFE7}.widget_google_translate_widget .goog-te-gadget-simple,.widget_google_translate_widget .goog-te-gadget-simple a,.site-footer-bar .widget_google_translate_widget .goog-te-gadget-simple a{color:#898EA2}.milestone-content .milestone-header,#eu-cookie-law input[type='submit']{background-color:#933693;border-color:#933693}.milestone-content .milestone-header,#eu-cookie-law input[type='submit']{color:#FFF}#eu-cookie-law input[type='submit']:focus,#eu-cookie-law input[type='submit']:hover{color:#933693}.conjmm-row div[class^=gr_custom_author],.conjmm-row div[class^=gr_custom_container] a{color:#6B6F81}.conjmm-row div[class^=gr_custom_container] a:hover{color:#933693}.site-footer div[class^=gr_custom_author]{color:#A5A8BB}.site-footer div[class^=gr_custom_container] a{color:#A5A8BB}.site-footer div[class^=gr_custom_container] a:hover{color:#8A91FF}.form-errors .form-error-message{color:#FFF !important;background-color:#FF4961}.entry-author .author-heading{border-color:#DDDFE7}p.stars:hover a:before,p.stars.selected a.active:before,.star-rating span:before{color:#FFBF71}.woocommerce-MyAccount-content legend,.woocommerce-account:not(.logged-in) .entry-content>.woocommerce>.woocommerce-form-login .woocommerce-LostPassword,#customer_login .woocommerce-LostPassword a,.woocommerce-table--order-downloads .download-product a,.woocommerce-table--order-details a,.woocommerce-thankyou-order-received,.woocommerce-MyAccount-content table.shop_table_responsive th,.woocommerce-MyAccount-content table.shop_table_responsive tr td:before,.woocommerce-table--order-details th,.conj-wc-two-step-checkout .conj-wc-checkout-order-review__heading,.woocommerce-checkout-review-order-table td.product-name,.woocommerce-cart-form__cart-item td,.woocommerce-cart-form__cart-item td a,.woocommerce-loop-category__title mark,.product_list_widget li>a,.product-search-results .entry span.title,.woocommerce-mini-cart__total>strong,.woocommerce-mini-cart-item a,.woocommerce-Tabs-panel--additional_information .shop_attributes td,.conj-wc-single-product-pagination a .title,.conj-wc-sticky-add-to-cart .price,.conj-wc-sticky-add-to-cart .conj-wc-sticky-add-to-cart-content .title,ol.commentlist .comment-text .woocommerce-review__author,.product_list_widget .woocommerce-Price-amount,.product_list_widget .product-title{color:#464855}#brands_a_z ul.brands_index,.error-404.not-found .widget_product_categories,.site-header-cart .widget_shopping_cart_content,.site-header-cart .widget_shopping_cart_content:before,.product-search-results .no-results,.product-search-results table.search-results,form.woocommerce-ResetPassword,form.track_order,#customer_login>div,.woocommerce-account:not(.logged-in) .entry-content>.woocommerce>h2,.woocommerce-account:not(.logged-in) .entry-content>.woocommerce>.woocommerce-form-login,.woocommerce-order-received .woocommerce-order-details,.checkout-slides .flex-nav-next,.conj-wc-two-step-checkout #customer_details,.checkout-slides .checkout-control-nav li a:not(.flex-active):after,.woocommerce-checkout-payment,.cart_totals .shop_table,.product-search.floating .product-search-results[style*='block'] .no-results:before,.product-search.floating .product-search-results[style*='block'] .search-results:before,.widget_price_filter .price_label .from,.widget_price_filter .price_label .to,.widget_price_filter .ui-slider .ui-slider-handle,.product_list_widget li img,ul.products li.product .added_to_cart,ul.products li.product{background-color:#FFF}ul.products li.product.conj-wc-product__layout-default .button{background-color:#FFF !important}li.conj-wc-product__layout-list .conj-wc-product-add-to-cart__layout-list .conj-wc-price__wrapper,#brands_a_z ul.brands a:hover,.widget_product_categories .product-categories li.current-cat-parent>a,.widget_product_categories .product-categories li.current-cat>a,#customer_login .woocommerce-LostPassword a:hover,.woocommerce-account:not(.logged-in) .entry-content>.woocommerce>.woocommerce-form-login .woocommerce-LostPassword a:hover,.woocommerce-MyAccount-navigation-link:not(.is-active)>a:hover,.woocommerce-MyAccount-navigation-link.is-active>a,.woocommerce-table--order-downloads .download-product a:hover,.woocommerce-table--order-details a:hover,ul.woocommerce-thankyou-order-details li strong,.checkout-slides .checkout-control-nav li a:not(.flex-active):after,.checkout-slides .checkout-control-nav .flex-active,.woocommerce-checkout-review-order-table td.product-total,.quantity .conj-wc-qty-btn__plus:not(:focus):not(:active):not(:hover),.woocommerce-cart-form__cart-item td a:hover,li.product-category a:hover .woocommerce-loop-category__title mark,li.product-category a:hover .woocommerce-loop-category__title,.product_list_widget li>a:hover,.woocommerce.widget_rating_filter li a:hover,.product-search-results .entry span.title:hover,.wc-brand-list-layered-nav-product_brand a:hover,.woocommerce-widget-layered-nav ul li a:hover,.woocommerce-pagination ul li .page-numbers:not(.dots):hover,.woocommerce-pagination ul li .page-numbers.current,.widget_product_categories .product-categories li a:hover,.woocommerce-mini-cart__total>.woocommerce-Price-amount,.woocommerce-mini-cart-item .woocommerce-Price-amount,.woocommerce-mini-cart-item .quantity,.conj-wc-single-product-pagination a[rel='next']:after,.conj-wc-single-product-pagination a[rel='prev']:before,.conj-wc-single-product-pagination a:hover .title,.woocommerce-tabs ul.tabs li.active a,.woocommerce-tabs ul.tabs li:hover a,.conj-wc-product-sharing .social-links__text:hover,.conj-wc-product-sharing .social-links__text i,.woocommerce-product-rating .woocommerce-review-link:hover,ul.products li.product.conj-wc-product__layout-default>.price,ul.products li.product .woocommerce-loop-product__link .woocommerce-loop-product__title:hover,ul.products li.product .woocommerce-product-details__categories a:hover,.product_list_widget .product-title:hover,ul.products li.product .added_to_cart:after,ul.products li.product.conj-wc-product__layout-default .button:after{color:#933693}.widget_product_categories .product-categories li.current-cat-parent>a:hover,.widget_product_categories .product-categories li.current-cat>a:hover,.woocommerce-orders-table__cell-order-actions .woocommerce-button:hover,ul.products li.product .added_to_cart:hover:after,ul.products li.product.conj-wc-product__layout-default .button:hover:after{color:#414B92}ul.woocommerce-thankyou-order-details li,abbr.required:before,.woocommerce-remove-coupon:before,.product-remove .remove:before,.quantity .conj-wc-qty-btn__minus:not(:focus):not(:active):not(:hover),.woocommerce-review__published-date,.single-product div.product .entry-summary del,.single-product div.product .entry-summary del .woocommerce-Price-amount,ul.products li.product .price .price-label{color:#9da1b3}ul.products li.product.conj-wc-product__layout-classic>.price,.widget_product_tag_cloud .tagcloud a,.woocommerce-product-gallery__trigger,ul.products li.product .category-flash,ul.products li.product .sold-out-flash,.woocommerce-checkout-review-order-table thead th,.woocommerce-cart-form table th,.woocommerce-pagination ul li .page-numbers,.single-product div.product .entry-summary .cart .quantity .qty,.single-product div.product .entry-summary .product_meta,.woocommerce-product-rating .woocommerce-review-link{color:#898d9f}li.conj-wc-product__layout-list .conj-wc-product-add-to-cart__layout-list .conj-wc-price__wrapper del,#brands_a_z ul.brands a,.site-footer-bar .widget_price_filter .price_label,.woocommerce-MyAccount-navigation-link:not(.is-active)>a,.checkout-slides .checkout-control-nav a:not(.flex-active),.conj-wc-checkout-order-review__heading,.woocommerce.widget_rating_filter li a,.star-rating,.product-search-results .entry span.description,.wc-brand-list-layered-nav-product_brand a,.woocommerce-widget-layered-nav ul li a,.widget_product_categories .product-categories li a,.woocommerce-tabs ul.tabs li a,.conj-wc-product-sharing .social-links__text,ul.products li.product .woocommerce-loop-product__link .woocommerce-product-details__short-description,ul.products li.product .woocommerce-product-details__categories a{color:#6B6F81}.woocommerce-terms-and-conditions,.widget_product_tag_cloud .tagcloud a,.woocommerce-product-gallery__trigger,.category-flash,.sold-out-flash,.conj-wc-product-sharing .social-links__text i{background-color:#f4f5fa}.conj-wc-product__flashs .new-flash,.woocommerce-message{background-color:#28D094}.woocommerce-message>a,.woocommerce-message .button{background-color:#0ab276 !important}.iziToast.iziToast-color-green{background-color:#28D094 !important}.conj-wc-product__flashs .new-flash,.woocommerce-message a,.woocommerce-message .button,.woocommerce-message,.iziToast.iziToast-color-green>.iziToast-body .iziToast-title,.iziToast.iziToast-color-green>.iziToast-body .iziToast-message,.iziToast.iziToast-color-green>.iziToast-body .iziToast-icon{color:#FFF !important}.woocommerce-store-notice,.woocommerce-info .button:active,.woocommerce-info .button:focus,.woocommerce-info .button:hover,.woocommerce-info .button:not(:focus):not(:active):not(:hover),.woocommerce-info,.woocommerce-noreviews{background-color:#1E9FF2}.woocommerce-info .showlogin,.woocommerce-info .showcoupon,.woocommerce-store-notice__dismiss-link,.woocommerce-info .button{background-color:#0081d4 !important}.iziToast.iziToast-color-blue{background-color:#1E9FF2 !important}.woocommerce-store-notice a,.woocommerce-store-notice,.woocommerce-info a,.woocommerce-info .button,.woocommerce-info,.woocommerce-noreviews a,.woocommerce-noreviews,.iziToast.iziToast-color-blue>.iziToast-body .iziToast-title,.iziToast.iziToast-color-blue>.iziToast-body .iziToast-message,.iziToast.iziToast-color-blue>.iziToast-body .iziToast-icon{color:#FFF !important}.conj-wc-product__flashs .popular-flash{background-color:#FFC06A}.iziToast.iziToast-color-orange{background-color:#FFC06A !important}.conj-wc-product__flashs .popular-flash,.iziToast.iziToast-color-orange>.iziToast-body .iziToast-title,.iziToast.iziToast-color-orange>.iziToast-body .iziToast-message,.iziToast.iziToast-color-orange>.iziToast-body .iziToast-icon{color:#FFF}.conj-wc-product-countdown__badge,.conj-wc-product__flashs .onsale,.woocommerce-error .button:active,.woocommerce-error .button:focus,.woocommerce-error .button:hover,.woocommerce-error .button:not(:focus):not(:active):not(:hover),.woocommerce-error{background-color:#FF4961}.woocommerce-error .button{background-color:#cd172f !important}.iziToast.iziToast-color-red{background-color:#FF4961 !important}.conj-wc-product__flashs .onsale,.woocommerce-error a,.woocommerce-error .button,.woocommerce-error,.iziToast.iziToast-color-red>.iziToast-body .iziToast-title,.iziToast.iziToast-color-red>.iziToast-body .iziToast-message,.iziToast.iziToast-color-red>.iziToast-body .iziToast-icon{color:#FFF !important}.conj-wc-product-countdown__badge{color:#FFF}.woocommerce-breadcrumb:after{background-color:#464855}.woocommerce-breadcrumb a:hover,.woocommerce-breadcrumb{color:#cdcdcd}.woocommerce-breadcrumb a:not(:hover){color:#FFF}.woocommerce-MyAccount-navigation-link.is-active:after,.woocommerce-MyAccount-navigation ul,.conj-wc-single-product-pagination a,.conj-wc-sticky-add-to-cart,ol.commentlist .comment_container,.woocommerce-tabs ul.tabs li.active:after,.woocommerce-tabs ul.tabs,.conj-wc-product-sharing ul,.single-product div.product .entry-summary,.single-product div.product .woocommerce-product-gallery{background-color:#FFF}.product-quantity .quantity,.conj-wc-product__layout-classic .price .conj-wc-price__wrapper,.product-search-results .entry img.thumbnail,.widget_price_filter .price_label .from,.widget_price_filter .price_label .to,.widget_price_filter .ui-slider .ui-slider-handle,.select2-container--default.select2 .selection .select2-selection--single,.select2-container--default.select2 .selection .select2-selection--multiple,.widget_product_categories .product-categories .cat-parent ul.children,.woocommerce-mini-cart-item,.woocommerce-mini-cart-item img.woocommerce-placeholder,.woocommerce-mini-cart-item img.attachment-woocommerce_thumbnail,.single-product .entry-summary .variations td.value #picker_pa_color.swatch-control .select-option a.swatch-anchor,.single-product div.product .entry-summary .variations td.value .swatch-control,li.product.conj-wc-product__layout-list>.conj-wc-product-add-to-cart__layout-list,.conj-wc-product-widgets .product_list_widget,li.conj-wc-product__layout-list .woocommerce-product-details__categories small a,#brands_a_z>h3:not(:first-of-type),.error-404-last .best-selling-products>h2,.error-404-first .promoted-products>h2,table.woocommerce-MyAccount-orders tr:not(:last-of-type),.woocommerce-MyAccount-content legend,.woocommerce-MyAccount-content>form>h3,.woocommerce-Address-title,.woocommerce-customer-details h2.woocommerce-column__title,.woocommerce-MyAccount-navigation-link.is-active:after,.woocommerce-MyAccount-navigation-link:not(:last-child),.woocommerce-MyAccount-navigation ul,.woocommerce-order-details__title,.woocommerce-order-downloads__title,.conj-wc-checkout-order-review__heading,.wc_payment_methods li:not(:last-child),.conj-wc-checkout-columns #ship-to-different-address>label,.woocommerce-billing-fields>h3,.woocommerce-pagination ul li .page-numbers,.woocommerce-cart-form__cart-item .product-thumbnail img,.site-footer .product_list_widget:not(.cart_list) li img,.site-footer-bar .product_list_widget:not(.cart_list) li img,.conjmm-row .product_list_widget:not(.cart_list) li img,#secondary.widget-area .product_list_widget:not(.cart_list) li img,.cart_totals>h2,.cross-sells>h2,.single-product div.product>.products>h2,.woocommerce-Reviews-title,.conj-wc-single-product-pagination a img,.conj-wc-sticky-add-to-cart img,.woocommerce-tabs .woocommerce-Tabs-panel--description table,.woocommerce-tabs ul.tabs li.active:after,.woocommerce-tabs ul.tabs li:not(:last-child),.woocommerce-tabs ul.tabs,.woocommerce-product-details__short-description,.single-product div.product .woocommerce-product-gallery .flex-control-thumbs li img{border-color:#DDDFE7}.checkout-slides .checkout-control-nav a.flex-active:before,.checkout-slides .checkout-control-nav li a.flex-active:after,.widget_price_filter .ui-slider .ui-slider-range,.single-product div.product .entry-summary .woocommerce-Price-amount,.conj-wc-product-sharing .social-links__text:hover i{background-color:#933693}.conj-wc-product-sharing .social-links__text:hover i{color:#e0e1e6}.woocommerce-password-strength.strong,.form-row.woocommerce-validated label:after,.StripeElement.StripeElement--complete:before,.stock.in-stock{color:#28D094}.woocommerce-password-strength.short,.form-row.woocommerce-invalid label:after,.StripeElement.invalid:before,.woocommerce-remove-coupon:hover:before,.product-remove .remove:hover:before,.site-footer .woocommerce-mini-cart-item .remove_from_cart_button,.site-footer-bar .woocommerce-mini-cart-item .remove_from_cart_button,li.conjmm-active .conjmm-mega-menu .woocommerce-mini-cart-item .remove_from_cart_button,.woocommerce-mini-cart-item .remove_from_cart_button,.stock.out-of-stock{color:#FF4961}.single-product div.product .entry-summary .woocommerce-Price-amount{color:#FFF}.product-search-results .product:after,.widget_price_filter .price_slider_wrapper .ui-widget-content,li.product.conj-wc-product__layout-list.conj-hide-wc-product__add-to-cart:not(.conj-hide-wc-product__price):after,li.product.conj-wc-product__layout-list.conj-hide-wc-product__price:not(.conj-hide-wc-product__add-to-cart):after,li.product.conj-wc-product__layout-list:not(.conj-hide-wc-product__add-to-cart):not(.conj-hide-wc-product__price):after,.checkout-slides .checkout-control-nav a:not(.flex-active):before,.widget_product_categories .product-categories .cat-parent ul.children li:before,ol.commentlist .comment-text .meta:after,.woocommerce-tabs .woocommerce-Tabs-panel--description table tr td:not(:last-of-type):after,.woocommerce-tabs .woocommerce-Tabs-panel--description table tr th:not(:last-of-type):after{background-color:#DDDFE7}.site-footer .woocommerce-mini-cart-item .remove_from_cart_button:hover,.site-footer-bar .woocommerce-mini-cart-item .remove_from_cart_button:hover,li.conjmm-active .conjmm-mega-menu .woocommerce-mini-cart-item .remove_from_cart_button:hover,.woocommerce-mini-cart-item .remove_from_cart_button:hover{color:#cd172f}.product-search.floating .product-search-results{background:#FFF !important}.site-wc-search form[role='search'].woocommerce-product-search:before,.site-wc-search form.product-search-form:before{color:#bbbfd1}.site-footer .product_list_widget .woocommerce-Price-amount,.site-footer .star-rating{color:#A5A8BB}.site-footer .product_list_widget li>a,.site-footer .product_list_widget .product-title{color:#A5A8BB}.site-footer .product_list_widget li>a:hover,.site-footer .product_list_widget .product-title:hover{color:#8A91FF}.conjmm-row .product_list_widget .woocommerce-Price-amount,.conjmm-row .product_list_widget .product-title{color:#6B6F81}.conjmm-row .product_list_widget .product-title:hover{color:#933693}li.conj-wc-product__layout-list .woocommerce-product-details__categories small a:hover,.woocommerce-pagination ul li .page-numbers:not(.dots):hover,.woocommerce-pagination ul li .page-numbers.current{border-color:#933693}.product-quantity .quantity,.select2-container--default.select2 .selection .select2-selection--single,.select2-container--default.select2 .selection .select2-selection--multiple{background-color:#FFF}.select2-container--default .select2-selection--multiple .select2-selection__rendered,.select2-container--default .select2-selection--single .select2-selection__rendered,form.product-search-form:before,.select2-container--default.select2 .selection .select2-selection--single,.select2-container--default.select2 .selection .select2-selection--multiple{color:#898EA2}.select2-dropdown,.select2-container--default .select2-search--dropdown .select2-search__field:focus,.select2-container--default.select2.select2-container--open .selection .select2-selection--single,.select2-container--default.select2.select2-container--open .selection .select2-selection--multiple{border-color:#898EA2}.select2-container--default .select2-search--dropdown .select2-search__field{border-color:#DDDFE7}.select2-container--default.select2 .selection .select2-selection--single,.select2-container--default.select2 .selection .select2-selection--multiple{background-image:linear-gradient(45deg,transparent 50%,#898EA2 50%),linear-gradient(135deg,#898EA2 50%,transparent 50%),linear-gradient(to right,rgba(255,255,255,0),rgba(255,255,255,0))}.StripeElement.StripeElement--complete,.form-row.woocommerce-validated .select2-container--default.select2 .selection .select2-selection,.form-row.woocommerce-validated .input-text{border-color:#28D094 !important}.StripeElement.invalid,.form-row.woocommerce-invalid .select2-container--default.select2 .selection .select2-selection,.form-row.woocommerce-invalid .input-text{border-color:#FF4961 !important}.product-search-form .product-search-field-clear{background-color:#FFF}.woocommerce-order-received .woocommerce-order,.woocommerce-checkout-review-order{background-color:#fcfcfc}form.track_order>p:first-of-type,.checkout-slides .checkout-control-nav li a.flex-active:after{color:#FFF}.checkout-slides .checkout-control-nav li a:not(.flex-active):after{box-shadow:0 0 0 6px #e0e1e6}.conj-wc-sticky-order-review:not(.conj-wc-checkout-columns):not(.conj-wc-checkout-stacked):not(.conj-wc-two-step__checkout) .woocommerce-checkout-review-order{top:30px}body.admin-bar.conj-wc-sticky-order-review:not(.conj-wc-checkout-columns):not(.conj-wc-checkout-stacked):not(.conj-wc-two-step__checkout) .woocommerce-checkout-review-order{top:62px}@media (min-width:62em){.conj-wc-checkout-columns #ship-to-different-address>label{color:#464855}}.woocommerce-password-strength.bad{color:#FFC06A}.woocommerce-password-strength.good{color:#1E9FF2}form.track_order>p:first-of-type{background:-webkit-linear-gradient(315deg,#933693 39%,#b6beff 100%);background:-o-linear-gradient(315deg,#933693 39%,#b6beff 100%);background:linear-gradient(135deg,#933693 39%,#b6beff 100%)}.woocommerce-mini-cart__buttons>a:not(.checkout):hover,.woocommerce-MyAccount-downloads-file,.woocommerce-orders-table__cell-order-actions .woocommerce-button{color:#933693 !important}.woocommerce-MyAccount-downloads-file:hover,.woocommerce-orders-table__cell-order-actions .woocommerce-button:hover{color:#414B92 !important}.select2-container--default .select2-results__option[aria-selected=true],.select2-container--default .select2-results__option[data-selected=true],.select2-container--default .select2-results__option--highlighted[aria-selected],.select2-container--default .select2-results__option--highlighted[data-selected],#brands_a_z ul.brands_index li a,.widget_product_tag_cloud .tagcloud a:hover,.site-header-cart:not(:hover):not(:focus) li:not(.current-menu-item) .cart-contents:not(:focus):not(:active):not(:hover){background-color:#933693;border-color:#933693;color:#FFF}.product-search-form .product-search-field-clear,#brands_a_z ul.brands_index li a:hover,.site-header-cart .current-menu-item .cart-contents,.site-header-cart .cart-contents:active,.site-header-cart .cart-contents:focus,.site-header-cart:focus .cart-contents,.site-header-cart:hover .cart-contents:hover,.site-header-cart:hover .cart-contents,.site-header-cart .cart-contents:hover{color:#933693}.woocommerce-mini-cart__buttons>a:not(.checkout){color:#6B6F81 !important;border-color:#DDDFE7 !important}.woocommerce-mini-cart__buttons>a:not(.checkout):hover{border-color:#933693 !important}.site-header .product-search-form .product-search-field-clear{background-color:#FFF}.conj-handheld-footer-bar .widget_product_search,.conj-handheld-footer-bar ul li a,.conj-handheld-footer-bar{background-color:#353745}.conj-handheld-footer-bar ul li a{color:#A5A8BB}.woocommerce-cart .conj-handheld-footer-bar .cart>a,.woocommerce-account .conj-handheld-footer-bar .my-account>a,.conj-handheld-footer-bar .conj-wc-handheld-search__visible,.conj-handheld-footer-bar ul li a:hover{color:#8A91FF}.conj-handheld-footer-bar .widget_product_search .woocommerce-product-search button:focus,.conj-handheld-footer-bar .widget_product_search .woocommerce-product-search button:active,.conj-handheld-footer-bar .widget_product_search .woocommerce-product-search button:hover{background-color:#933693;border-color:#933693 !important;color:#FFF !important}.conj-homepage-template .conj-wc-product-hero{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:70px;padding-right:0;padding-bottom:70px;padding-left:0}.conj-homepage-template .conj-wc-product-hero .variable-lbl{color:#9da1b3}.conj-homepage-template .conj-wc-product-hero{background-color:#FFF}.conj-homepage-template .conj-wc-product-hero,.conj-homepage-template .conj-wc-product-hero .title{color:#6B6F81}.conj-homepage-template .conj-wc-shop-by-category__layout-card-view .meta p:last-child a,.conj-homepage-template .conj-wc-product-hero .content .added_to_cart:not(:focus):not(:active):not(:hover){background-color:#933693;border-color:#933693}.conj-homepage-template .conj-wc-shop-by-category__layout-card-view .meta p:last-child a,.conj-homepage-template .conj-wc-product-hero .content .added_to_cart:not(:focus):not(:active):not(:hover),.conj-homepage-template .conj-wc-product-brands .entry-view-all .button.view-all:hover{color:#FFF}.conj-homepage-template .conj-wc-product-hero .content .added_to_cart:focus,.conj-homepage-template .conj-wc-product-hero .content .added_to_cart:active,.conj-homepage-template .conj-wc-product-hero .content .added_to_cart:hover{color:#933693;background-color:#FFF}.conj-homepage-template .conj-wc-shop-by-category{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:70px;padding-right:0;padding-bottom:50px;padding-left:0}.conj-homepage-template .conj-wc-shop-by-category__layout-block-view .product-category,.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .row{background-color:#FFF}.conj-homepage-template .conj-wc-shop-by-category__layout-card-view .meta p:first-child a,.conj-homepage-template .conj-wc-shop-by-category__layout-card-view .meta{color:#FFF}.conj-homepage-template .conj-wc-shop-by-category__layout-card-view .product-category:after{background-color:#000}.conj-homepage-template .conj-wc-product-brands .entry-view-all .button.view-all:hover,.conj-homepage-template .conj-wc-shop-by-category__layout-card-view .meta p:last-child a:hover{background-color:#414B92}.conj-homepage-template .conj-wc-product-brands .entry-view-all .button.view-all:hover{border-color:#414B92}.conj-homepage-template .conj-wc-shop-by-category .product-category .meta li a{color:#6B6F81}.conj-homepage-template .conj-wc-shop-by-category__layout-block-view .product-category:hover>.meta a,.conj-homepage-template .conj-wc-product-reviews .review-item .meta p>a:hover,.conj-homepage-template .conj-wc-product-hero .price .woocommerce-Price-amount,.conj-homepage-template .conj-wc-shop-by-category .product-category .meta>a:hover,.conj-homepage-template .conj-wc-shop-by-category .product-category .meta li a:hover{color:#933693}.conj-homepage-template .conj-wc-shop-by-category .product-category .meta>a{color:#898d9f}.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .col-1 .product-category:nth-child(n+1):before{background-color:#eff0f5}.conj-homepage-template .conj-wc-best-selling-products{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:50px;padding-right:0;padding-bottom:50px;padding-left:0}.conj-homepage-template .conj-wc-featured-products{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:50px;padding-right:0;padding-bottom:50px;padding-left:0}.conj-homepage-template .conj-wc-recent-products{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:50px;padding-right:0;padding-bottom:50px;padding-left:0}.conj-homepage-template .conj-wc-onsale-products{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:50px;padding-right:0;padding-bottom:50px;padding-left:0}.conj-homepage-template .conj-wc-top-rated-products{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:10px;padding-right:0;padding-bottom:50px;padding-left:0}.conj-homepage-template .conj-wc-product-reviews{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:50px;padding-right:0;padding-bottom:50px;padding-left:0}.conj-homepage-template .conj-wc-product-reviews .review-item.carousel-cell{background-color:#FFF}.conj-homepage-template .conj-wc-shop-by-category__layout-block-view .product-category .meta a,.conj-homepage-template .conj-wc-product-reviews .review-item>.rating>p,.conj-homepage-template .conj-wc-product-reviews .review-item .meta p>a,.conj-homepage-template .conj-wc-product-reviews .review-item>.avatar span{color:#464855}.conj-homepage-template .conj-wc-product-reviews .flickity-prev-next-button:not(:hover) .arrow{fill:#6B6F81}.conj-homepage-template .conj-wc-product-reviews .flickity-prev-next-button:hover .arrow{fill:#933693}.conj-homepage-template .conj-wc-product-countdown{margin-top:20px;margin-right:0;margin-bottom:0;margin-left:0;padding-top:80px;padding-right:0;padding-bottom:188px;padding-left:0}.conj-homepage-template .conj-wc-product-countdown:after{opacity:0.3;background-color:#000}.conj-homepage-template .conj-wc-product-countdown__heading,.conj-homepage-template .conj-wc-product-countdown{color:#FFF}.conj-homepage-template .conj-wc-product-widgets{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:30px;padding-right:0;padding-bottom:67px;padding-left:0}.conj-homepage-template .conj-wc-product-widgets{border-color:#DDDFE7}.conj-homepage-template .conj-wc-product-widgets .widgettitle{border-color:#933693}.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .product-category{border-color:#eff0f5}@media (min-width:27.5em){.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .col-2 .product-category:not(:nth-child(2n)){box-shadow:inset -1px 0 0 0 #eff0f5}.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .col-2 .product-category:nth-child(2n+1):before{background-color:#eff0f5}}@media (min-width:62em){.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .col-3 .product-category:not(:nth-child(3n)){box-shadow:inset -1px 0 0 0 #eff0f5}.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .col-3 .product-category:nth-child(3n+1):before{background-color:#eff0f5}}@media (max-width:62em) and (min-width:27.5em){.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .col-3 .product-category:not(:nth-child(2n)){box-shadow:inset -1px 0 0 0 #eff0f5}.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .col-3 .product-category:nth-child(2n+1):before{background-color:#eff0f5}}@media (max-width:27.5em){.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .col-3 .product-category:nth-child(n+1):before,.conj-homepage-template .conj-wc-shop-by-category__layout-hieratical .col-2 .product-category:nth-child(n+1):before{background-color:#eff0f5}}.conj-homepage-template .conj-wc-product-brands{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:50px;padding-right:0;padding-bottom:50px;padding-left:0}.conj-homepage-template .conj-wc-product-brands{background-color:#FFF}.conj-homepage-template .conj-slider{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:70px;padding-right:0;padding-bottom:70px;padding-left:0}.conj-homepage-template .conj-slider.conj-slider-navigation-layout__group .flickity-prev-next-button,.conj-homepage-template .conj-slider-navigation-layout__group .flickity-page-dots,.conj-homepage-template .conj-slider{background-color:#FFF}.conj-homepage-template .conj-slider .flickity-prev-next-button:before{color:#9da1b3}.conj-homepage-template .conj-services{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:50px;padding-right:0;padding-bottom:45px;padding-left:0}.conj-homepage-template .conj-services .service>.meta>span:first-of-type{color:#464855}.conj-homepage-template .conj-slider.conj-slider-navigation-layout__group .flickity-prev-next-button,.conj-homepage-template .conj-slider-navigation-layout__group .flickity-page-dots,.conj-homepage-template .conj-services-layout__stacked .service>.icon{border-color:#DDDFE7}.conj-homepage-template .homepage-content{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:50px;padding-right:0;padding-bottom:50px;padding-left:0}.conj-homepage-template .entry-content p:last-of-type>a:only-child,.conj-homepage-template .homepage-content,.conj-homepage-template .conj-services-layout__stacked,.conj-homepage-template .conj-services-layout__block .service,.conj-homepage-template .conj-services-layout__aligned,.conj-homepage-template .homepage-content:after{background-color:#FFF}.conj-homepage-template .homepage-content:after{opacity:0}.conj-homepage-template .conj-slider .flickity-prev-next-button:hover:before,.conj-homepage-template .conj-services .service .icon,.conj-homepage-template .conj-section__button-edit{color:#933693}.conj-homepage-template .conj-section__button-edit:hover{background-color:#eff0f5}.conj-homepage-template .conj-blog-posts{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:50px;padding-right:0;padding-bottom:50px;padding-left:0}.conj-homepage-template .conj-section__button-edit,.conj-homepage-template .conj-slider.conj-slider-navigation-layout__group .flickity-prev-next-button:hover,.conj-homepage-template .conj-services-layout__block .service>.icon{background-color:#f4f5fa}.site-footer-bar h1,.site-footer-bar h2,.site-footer-bar h3,.site-footer-bar h4,.site-footer-bar h5,.site-footer-bar h6,.site-footer-bar .product-search-results .entry span.price,.site-footer-bar .product_list_widget .woocommerce-Price-amount,.site-footer-bar .woocommerce-mini-cart__total>strong,.site-footer-bar .star-rating,.site-footer-bar{color:#FFF}.site-footer-bar{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:56px;padding-right:0;padding-bottom:70px;padding-left:0}.site-footer-bar>.col-full{min-height:40vh}.site-footer-bar .widget_contact_info>div>div:before,.site-footer-bar .widget_conj_contact_info_widget>div>div:before,.site-footer-bar:after{background-color:#000}.site-footer-bar:after{opacity:0.7}.site-footer-bar .widget_text p>a:only-child{border-color:#FFF}.site-footer-bar .widget_text p>a:only-child:hover,.site-footer-bar .product_list_widget .product-title,.site-footer-bar .widget_product_categories .product-categories li a,.site-footer-bar .woocommerce.widget_rating_filter li a,.site-footer-bar .widget a{color:#FFF}.site-footer-bar .woocommerce-mini-cart__buttons>a:not(.checkout){color:#FFF !important;border-color:#FFF !important}.site-footer-bar .woocommerce-mini-cart__buttons>a:not(.checkout):hover{color:#933693 !important;border-color:#933693 !important}.site-footer-bar .widget + .widget:before,.site-footer-bar .widget_text p>a:only-child:hover{background-color:#933693;border-color:#933693}.site-footer-bar .product_list_widget .product-title:hover,.site-footer-bar .widget_product_categories .product-categories li a:hover,.site-footer-bar .woocommerce.widget_rating_filter li a:hover,.site-footer-bar .widget_categories .current-cat-parent>a,.site-footer-bar .widget_categories .current-cat>a,.site-footer-bar ul.menu .current_page_parent>a,.site-footer-bar ul.menu .current_page_item>a,.site-footer-bar .widget_pages .current_page_parent>a,.site-footer-bar .widget_pages .current_page_item>a,.site-footer-bar .widget a:hover{color:#933693}.site-footer-bar .calendar_wrap tfoot tr:not(:last-of-type) td,.site-footer-bar .calendar_wrap tbody tr:not(:last-of-type) td,.site-footer-bar .calendar_wrap td{border-color:#000}.site-footer-bar .widget_product_tag_cloud .tagcloud a,.site-footer-bar .widget_tag_cloud a{color:#898d9f}.site-footer-bar .widget_conj_social_media_icons_widget ul.pe-social a:hover,.site-footer-bar .widget_product_tag_cloud .tagcloud a:hover,.site-footer-bar .widget_tag_cloud a:hover{color:#FFF}.site-footer-bar ul.menu .sub-menu:before,.site-footer-bar ul.menu .sub-menu a,.site-footer-bar ul.menu .sub-menu,.site-footer-bar .widget_conj_social_media_icons_widget ul.pe-social a{color:#6B6F81;background-color:#f4f5fa}.site-footer-bar .widget_conj_social_media_icons_widget ul.pe-social a:hover{background-color:#933693}.site-footer-bar .widget_conj_promo_box_widget .promo-box>a{color:#414B92}.site-footer-bar ul.menu .sub-menu a:hover,.site-footer-bar .widget_conj_promo_box_widget .promo-box>a:hover{color:#933693}.site-footer-bar div[class^=gr_custom_author]{color:#FFF}
    </style>
    <style type='text/css'>img#wpstats{display:none}</style>	<noscript><style>.woocommerce-product-gallery{ opacity: 1 !important; }</style></noscript>
    <style type="text/css">.recentcomments a{display:inline !important;padding:0 !important;margin:0 !important;}</style>
    <style type="text/css">
        .site-title,
        .site-title a,
        .site-description {
            color: #6b6f81;
        }
    </style>
    <style type="text/css" id="custom-background-css">
        body.custom-background { background-color: #f4f5fa; }
    </style>

</head>

<body class="home page-template page-template-page-templates page-template-template-homepage page-template-page-templatestemplate-homepage-php page page-id-115 logged-in custom-background woocommerce-demo-store woocommerce-no-js conj-has-social__menu conj-has-secondary__menu has-sidebar conj-homepage-template woocommerce-running conj-header-logo__left conj-social-menu__left conj-secondary-menu__right conj-primary-menu__left left-sidebar conj-copyright-content__left">
<div id="left" class="handheld-offcanvas c-offcanvas is-hidden" role="complementary">
    <button class="close-btn">
        <i class="feather-x"></i>
    </button>
    <div id="handheld-slinky-menu">
        <div class="handheld-navigation">
            <ul id="menu-push-menu" class="menu">
                <li id="menu-item-2282" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-115 current_page_item current-menu-ancestor current-menu-parent current_page_parent current_page_ancestor menu-item-2282"><a href="{{ url.getBaseUri() }}">HOME</a></li>
                {% for departamento in departamentos %}
                    <li id="menu-item-2283" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-2283"><a href="{{ url.getBaseUri()
                        }}busca?departamento={{ departamento.nome }}">{{ departamento.nome }}</a>
                        <ul class="sub-menu">
                            {% for categoria in departamento.categorias %}
                                <li id="menu-item-2229" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-2229">
                                    <a href="{{ url.getBaseUri() }}busca?departamento={{ departamento.nome }}&categoria={{ categoria["nome"] }}">{{ categoria["nome"] }}</a>
                                    {% if categoria["subcategorias"]|length > 0 %}
                                        <ul class="sub-menu">
                                            {% for subcategoria in categoria["subcategorias"] %}
                                                <li id="menu-item-2372" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2369">
                                                    <a href="{{ url.getBaseUri() }}busca?departamento={{ departamento.nome }}&categoria={{ categoria["nome"]
                                                    }}&subcategoria={{ subcategoria }}">{{ subcategoria }}</a>
                                                </li>
                                            {% endfor %}
                                        </ul>
                                    {% endif %}
                                </li>
                            {% endfor %}
                        </ul>
                    </li>
                {% endfor %}
                <li id="menu-item-2281" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2281">
                    <a href="{{ url.getBaseUri() }}contato">Contato</a>
                </li>
                <li id="menu-item-2299" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2299">
                    <a href="{{ url.getBaseUri() }}carrinho">Carrinho</a>
                </li>
            </ul>
        </div>
    </div><!-- #handheld-slinky-menu -->
    <div class="offcanvas-nav d-block d-md-none" data-set="bs"></div>
</div>

<div id="conj-site__wrapper">
    <div id="page" class="hfeed site c-offcanvas-content-wrap">
        <header id="masthead" class="site-header jarallax" role="banner" data-jarallax data-img-element="jarallax-header-img" data-speed="1">
            <div class="col-full">
                <div class="site-top-bar">
                    <nav class="secondary-navigation" role="navigation" aria-label="Secondary Navigation">
                        <div class="menu-secondary-menu-container">
                            <ul id="menu-secondary-menu" class="menu">
                                {% if not session.has("usuario") %}
                                    <li id="menu-item-2300" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2300">
                                        <a href="{{ url.getBaseUri() }}autenticacao">Login / Cadastro</a>
                                    </li>
                                {% else %}
                                    <li id="menu-item-2300" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2300">
                                        <a href="{{ url.getBaseUri() }}conta">{{ username }}</a>
                                    </li>
                                    <li id="menu-item-2274" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2274">
                                        <a href="{{ url.getBaseUri() }}conta/logout">Sair</a>
                                    </li>
                                {% endif %}
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="site-branding">
                    <h1 class="beta site-title">
                        <a href="{{ url.getBaseUri() }}" rel="home">
                            <img src="https://lh3.googleusercontent.com/-8Frbiyi3m60/W0Zl9h2JDiI/AAAAAAAAD7k/RITqPTrVPhYbX1X4MIIMi-9MGmFmPaiOQCL0BGAYYCw/h55/2018-07-11.png" alt="home">
                        </a>
                    </h1>
                </div>
                <!-- MOBILE -->
                <div class="site-wc-search">
                    <div id="product-search-1" class="product-search floating">
                        <div class="product-search-form">
                            <form action="{{ url.getBaseUri() }}busca" id="product-search-form-0" class="product-search-form" method="get">
                                <input id="product-search-field-1" name="nome" type="text" class="product-search-field" placeholder="Procurar produtos&hellip;" autocomplete="off">
                                <button type="submit">Procurar</button>
                                <span title="Limpar" class="product-search-field-clear" style="display:none"></span>
                            </form>
                        </div>
                        <div id="product-search-results" class="product-search-results">
                            <table class="search-results">
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- END MOBILE -->
                <ul id="site-header-cart" class="site-header-cart">
                    <li class="">
                        <a class="cart-contents" href="{{ url.getBaseUri() }}carrinho" title="Carrinho">
                            <span class="amount" id="cart-amount">R&#036;<span>{{ totalcarrinho is defined ? totalcarrinho.total : 0 }}</span></span>
                            <span class="count" id="cart-count"><span>{{ totalcarrinho is defined ? totalcarrinho.itens : 0 }}</span> items</span>
                        </a>
                    </li>
                    <li>
                        <div class="widget woocommerce widget_shopping_cart">
                            {% if carrinho is defined %}
                            <div class="widget_shopping_cart_content">
                                {% if 1 == 1 %}
                                    <ul class="woocommerce-mini-cart cart_list product_list_widget" id="cart-list-dropdown">
                                        {% for item in carrinho %}
                                            <li class="woocommerce-mini-cart-item mini_cart_item" data-item="{{ item["_id"] }}" data-qtd="{{ item["quantity"] }}" data-pr="{{ item["preco"] }}">
                                                <a href="javascript:void(0);" class="remove remove_from_cart_button"
                                                   aria-label="Remover item" data-product_id="{{ item["_id"] }}">×</a>
                                                <a href="{{ url.getBaseUri() }}produto/visualizacao/{{ item["_id"] }}">
                                                    <img alt="produto" width="418" height="418" style="max-width: 100px;" src="{{ url.getStatic() }}uploads/produtos/{{ item["imagem"] }}">
                                                    {{ item["nome"] }}
                                                </a>

                                                <span class="quantity">{{ item["quantity"] }} ×
                                                <span class="woocommerce-Price-amount amount">
                                                    <span class="woocommerce-Price-currencySymbol">R$</span>
                                                        {{ item["quantity"] * item["preco"] }}
                                                    </span>
                                                </span>
                                            </li>
                                        {% endfor %}
                                    </ul>
                                    <p class="woocommerce-mini-cart__total total">
                                        <strong>Subtotal:</strong>
                                        <span class="woocommerce-Price-amount amount">
                                            R$<span class="woocommerce-Price-currencySymbol" id="cart-subtotal">{{ totalcarrinho.total }}</span>
                                        </span>
                                    </p>
                                    <p class="woocommerce-mini-cart__buttons buttons"><a href="{{ url.getBaseUri() }}carrinho" class="button wc-forward">Carrinho</a>
                                        <a href="{{ url.getBaseUri() }}checkout" class="button checkout wc-forward">Finalizar</a></p>
                                    {% else %}
                                        <p class="woocommerce-mini-cart__total total">
                                            <span class="woocommerce-Price-amount amount">
                                                <span class="woocommerce-Price-currencySymbol">Nenhum produto selecionado</span>
                                            </span>
                                        </p>
                                {% endif %}
                            </div>
                            {% endif %}
                        </div>
                    </li>
                </ul>
                <div class="primary-navigation">
                    <nav id="site-navigation" class="main-navigation" itemscope="itemscope" itemtype="https://schema.org/SiteNavigationElement">
                        <button class="handheld-menu-toggle js-offcanvas-toggler js-handheld-offcanvas-toggler">
                            Menu
                            <span class="hamburger-nav-icon">
						    <span class="icon-bar"></span>
						    <span class="icon-bar"></span>
						    <span class="icon-bar"></span>
					        </span>
                        </button>
                        <div class="primary-navigation">
                            <ul id="menu-primary-menu" class="menu">
                                <li id="menu-item-2277" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-115 current_page_item menu-item-2277 conjmm-active">
                                    <a href="{{ url.getBaseUri() }}">Home</a>
                                </li>
                                {% for departamento in departamentos %}
                                    <li id="menu-item-2278" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2278 conjmm-active menu-item-has-children">
                                        <a href="{{ url.getBaseUri() }}busca?departamento={{ departamento.nome }}">{{ departamento.nome }}</a>
                                        {% if departamento.categorias|length > 0 %}
                                            <ul class="sub-menu">
                                                <li>
                                                    <div class="conjmm-mega-menu">
                                                        <div class="conjmm-row">
                                                            {% for categoria in departamento.categorias %}
                                                                <div class="conjmm-span-2">
                                                                    <aside id="nav_menu-6" class="widget widget_nav_menu">
                                                                        <h5 class="{{ categoria["subcategorias"]|length > 0 ? 'widget-title' : '' }}">
                                                                            <a href="{{ url.getBaseUri() }}busca?departamento={{ departamento.nome }}&categoria={{ categoria["nome"]
                                                                            }}">{{ categoria["nome"] }}</a>
                                                                        </h5>
                                                                        <div class="menu-shop-column-1-container">
                                                                            <ul id="menu-shop-column-1" class="menu">
                                                                                {% for subcategoria in categoria["subcategorias"] %}
                                                                                    <li id="menu-item-2372" class="">
                                                                                        <a href="{{ url.getBaseUri() }}busca?departamento={{ departamento.nome }}&categoria={{ categoria["nome"]
                                                                                        }}&subcategoria={{ subcategoria }}">{{ subcategoria }}</a>
                                                                                    </li>
                                                                                {% endfor %}
                                                                            </ul>
                                                                        </div>
                                                                    </aside>
                                                                </div>
                                                            {% endfor %}
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        {% endif %}
                                    </li>
                                {% endfor %}
                                <li id="menu-item-2299" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2299">
                                    <a href="{{ url.getBaseUri() }}contato">Contato</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>

            </div>
        </header>

        {{ content() }}

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css">
        <style>
            .whatsapp{
                padding-left: 60px;
                position: relative;
                min-height: 48px;
                -webkit-box-sizing: center;
                -moz-box-sizing: center;
                box-sizing: center;
                line-height: 48px;
            }
            .whatsapp .child{
                background-color: #3A3C4A;
                align-items: center;
                display: flex;
                position: absolute;
                left: 0;
                width: 48px;
                height: 48px;
                line-height: 48px;
                font-size: 20px;
                text-align: center;
            }
        </style>

        <footer id="colophon" class="site-footer" role="contentinfo" itemscope="itemscope">
            <div class="col-full">

                <div class="footer-widgets row-1 col-3 fix">
                    <div class="block footer-widget-1">
                        <div id="conj_contact_info_widget-4" class="widget widget_conj_contact_info_widget">
                            <div class="widget-title__wrapper">
                                <span class="widget-title">ENTRE EM CONTATO</span>
                            </div>
                            <div itemscope itemtype="https://schema.org/LocalBusiness">
                                <div class="confit-phone">
                                    <span itemprop="telephone">(34) 3235-7938 </span>
                                </div>
                                <div class="whatsapp">
                                    <div class="child">
                                        &nbsp;&nbsp;&nbsp;
                                        <i class="fab fa-whatsapp"></i>
                                    </div>
                                    <span itemprop="telephone"> (34) 99651-3842 </span>
                                </div>
                                <div class="confit-email">
                                    <a href="mailto:info@site-name.com">udipop@udipop.com.br</a>
                                </div>
                            </div>
                        </div>
                        <div id="conj_social_media_icons_widget-4" class="widget widget_conj_social_media_icons_widget">
                            <ul class="pe-social">
                                <li>
                                    <a href="https://www.facebook.com/VendasUDIPOP/" class="feather-facebook" target="_blank">
                                        <span class="screen-reader-text">View mypreview&#8217;s profile on Facebook</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="block footer-widget-2">
                        <div id="nav_menu-3" class="widget widget_nav_menu">
                            <div class="widget-title__wrapper">
                                <span class="widget-title">DEPARTAMENTOS</span>
                            </div>
                            <div class="menu-blog-pages-container">
                                <ul id="menu-blog-pages" class="menu">
                                    {% for departamento in departamentos %}
                                        <li id="menu-item-2259" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2259">
                                            <a href="{{ url.getBaseUri() }}busca?departamento={{ departamento.nome }}">{{ departamento.nome }}</a>
                                        </li>
                                    {% endfor %}
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="block footer-widget-3">
                        <div id="nav_menu-4" class="widget widget_nav_menu">
                            <div class="widget-title__wrapper">
                                <span class="widget-title">CONTA</span>
                            </div>
                            <div class="menu-shop-layouts-container">
                                <ul id="menu-shop-layouts" class="menu">
                                    <li id="menu-item-2268" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2268">
                                        <a href="{{ url.getBaseUri() }}conta/">Minha conta</a>
                                    </li>
                                    <li id="menu-item-2268" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2268">
                                        <a href="{{ url.getBaseUri() }}conta/pedidos">Meus pedidos</a>
                                    </li>
                                    <li id="menu-item-2268" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2268">
                                        <a href="{{ url.getBaseUri() }}conta/detalhes">Detalhes da conta</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="site-info">
                    <span class="site-wp-credits">Desenvolvido por
                        <a style="color:#FFF;" href="https://webearte.com.br" target="_blank" rel="nofollow">Webearte</a>
                    </span>
                </div>

            </div><!-- .col-full -->
        </footer>
    </div>
</div>

<a href="#" id="conj-scroll-to-top__btn"></a>

<div class="conj-handheld-footer-bar" style="position: fixed !important; bottom: 0 !important;width: 100%;">
    <ul class="columns-3">
        {% if not session.has("usuario") %}
            <li id="menu-item-2300" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2300" style="margin-top: 10px; !important;text-align: center;">
                <a style="line-height: 50px;" href="{{ url.getBaseUri() }}autenticacao">Autenticação</a>
            </li>
        {% else %}
            <li id="menu-item-2300" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2300" style="margin-top: 10px; !important;text-align: center;">
                <a style="line-height: 50px;" href="{{ url.getBaseUri() }}conta">{{ username }}</a>
            </li>
        {% endif %}
        <li class="search">
            <a href="javascript:void(0);">Procurar</a>
            <div class="widget woocommerce widget_product_search">
                <div id="product-search-1" class="product-search floating">
                    <div class="product-search-form">
                        <form action="{{ url.getBaseUri() }}busca" id="product-search-form-0" class="product-search-form" method="get">
                            <input id="product-search-field-0" name="nome" type="text" class="product-search-field" placeholder="Procurar produtos&hellip;" autocomplete="off">
                            <button type="submit">Procurar</button>
                            <span title="Limpar" class="product-search-field-clear" style="display:none"></span>
                        </form>
                    </div>
                    <div id="product-search-results-1" class="product-search-results"></div>
                </div>
            </div>
        </li>
        <li class="cart">
            <a class="footer-cart-contents" id="cartItensMobile" href="{{ url.getBaseUri() }}carrinho" title="Carrinho">{{ totalcarrinho is defined ? totalcarrinho.itens : ''}}</a>
        </li>
    </ul>
</div>

<script type="application/ld+json">
    {"@context":"https:\/\/schema.org\/","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":"1","item":{"name":"Home"}}]}
</script>

<script>
    (function() {function addEventListener(element,event,handler) {
        if(element.addEventListener) {
            element.addEventListener(event,handler, false);
        } else if(element.attachEvent){
            element.attachEvent('on'+event,handler);
        }
    }function maybePrefixUrlField() {
        if(this.value.trim() !== '' && this.value.indexOf('http') !== 0) {
            this.value = "http://" + this.value;
        }
    }

        var urlFields = document.querySelectorAll('.mc4wp-form input[type="url"]');
        if( urlFields && urlFields.length > 0 ) {
            for( var j=0; j < urlFields.length; j++ ) {
                addEventListener(urlFields[j],'blur',maybePrefixUrlField);
            }
        }/* test if browser supports date fields */
        var testInput = document.createElement('input');
        testInput.setAttribute('type', 'date');
        if( testInput.type !== 'date') {

            /* add placeholder & pattern to all date fields */
            var dateFields = document.querySelectorAll('.mc4wp-form input[type="date"]');
            for(var i=0; i<dateFields.length; i++) {
                if(!dateFields[i].placeholder) {
                    dateFields[i].placeholder = 'YYYY-MM-DD';
                }
                if(!dateFields[i].pattern) {
                    dateFields[i].pattern = '[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])';
                }
            }
        }

    })();
</script>
<script type="text/javascript">
    var c = document.body.className;
    c = c.replace(/woocommerce-no-js/, 'woocommerce-js');
    document.body.className = c;
</script>

<style>
    .site-content{
        z-index: 1;
    }
    #masthead{
        z-index: 10;
    }
</style>

{{ assets.outputJs() }}

<link rel='stylesheet' id='wpcom-notes-admin-bar-css'  href='{{ url.getStatic() }}css/admin-bar.css' type='text/css' media='all' />
<link rel='stylesheet' id='noticons-css'  href='' type='text/css' media='all' />
<link rel='stylesheet' id='product-search-css'  href='{{ url.getStatic() }}css/product-search.css' type='text/css' media='all' />
<!--[if lte IE 8]>
<link rel='stylesheet' id='jetpack-carousel-ie8fix-css'  href='{{ url.getStatic() }}css/jetpack-carousel.css' type='text/css' media='all' />
<![endif]-->
<script type='text/javascript' src='{{ url.getStatic() }}js/photon.min.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/devicepx-jetpack.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/blockui.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/js.cookie.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/woocomerce.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/cart_fragments.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/variant.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/modernizr.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/offcanvas.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/append-around.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/navigation.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/slinky.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/fitvids.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/jarallax.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/waypoints.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/izitoast.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/downcount.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/flickity.dpkg.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/gotop.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/flexslider.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/conj.min.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/wp-embed.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/underscore.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/backbone.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/mustache.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/notes-common.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/admin-bar.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/typewatch.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/product-search.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/spin.min.js'></script>
<script type='text/javascript' src='{{ url.getStatic() }}js/jquery.spin.js'></script>

</body>
</html>