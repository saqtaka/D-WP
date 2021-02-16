<!doctype html>
<html lang="ja">

<head>
    <meta charset="<?php bloginfo( 'charset' ); ?>" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="profile" href="https://gmpg.org/xfn/11" />
    
    <!-- wp_head() start -->
    <?php wp_head(); ?>
    <!-- wp_head() end -->

    <!-- titleタグを表示 -->
	<title><?php wp_title('|', true, 'right'); bloginfo('name'); ?></title>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-CN8MM63GKD"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-CN8MM63GKD');
    </script>

    <!-- Global AdSense -->
    <script data-ad-client="ca-pub-4823694607611749" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	
	<!-- Chart.jp -->
	<script src="<?php echo get_stylesheet_directory_uri(); ?>/js/Chart.min.js"></script>

	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

	<!-- pwa -->
    <link rel="manifest" href="manifest.json">
    <link rel="apple-touch-icon" href="icon.png" sizes="192x192"/>
    <script>
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', function() {
            navigator.serviceWorker.register('/serviceWorker.js').then(function(registration) {
                console.log('serviceWorker registed.', registration.scope);
            }, function(err) {
                console.log('serviceWorker error.', err);
            });
        });
    }
    </script>

    <link rel="stylesheet" href="<?php echo get_stylesheet_directory_uri(); ?>/style.css">
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand blog-title" href="<?php echo home_url(); ?>"><?php bloginfo( 'name' ); ?></a>
            <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button> -->
      
            <!-- <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        作ったもの
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="<?php echo home_url(); ?>/chika">チカブラフ</a>
                        <a class="dropdown-item" href="<?php echo home_url(); ?>/population">日本の人口予測</a>
                        <a class="dropdown-item" href="https://docsearch.portability.info">プログラマ仕様検索</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        カテゴリー
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <?php
                            $args_category = array(
                            'orderby' => 'title',
                            'order' => 'ASC'
                            );
                
                            # カテゴリーの一覧を取得
                            $categories = get_categories( $args_category );
                
                            # 取得したカテゴリーでループ
                            foreach( $categories as $category ){

                                # パラメータを設定
                                $args_post = array(
                                    'post_type' => 'post',
                                    'post_status' => 'publish',
                                    'posts_per_page' => -1,
                                    'category_name' => $category->name,
                                    'orderby' => 'title',
                                    'order' => 'ASC'
                                );

                                # オブジェクトを生成
                                $the_query = new WP_Query( $args_post );

                                if($the_query->post_count > 0) {

                                echo '<a class="dropdown-item" href="' . get_category_link( $category->term_id ) . '">' . $category->name . '(' . $the_query->post_count . ')</a>';

                                }
                            
                                # リセット
                                wp_reset_postdata();
                                unset($args_post);
                            }
                        ?>
                    </div>
                </li>
            </ul>
        </nav>
    </header>

    <!-- <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script> -->
    <!-- ヘッダー -->
    <!-- <ins class="adsbygoogle"
        style="display:block"
        data-ad-client="ca-pub-4823694607611749"
        data-ad-slot="4557387643"
        data-ad-format="auto"
        data-full-width-responsive="true"></ins>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script> -->