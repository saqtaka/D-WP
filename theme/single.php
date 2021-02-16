<?php get_header(); ?>

<?php
    get_template_part('functions/fudousan');
	get_template_part('news');
?>

<?php
    /* Start the Loop */
    while ( have_posts() ) :
        the_post();

        echo '<div id="post-content" class="container">';

        /* Set Title */
        echo '  <div class="row justify-content-center mt-4 mb-4 p-4">';
        echo '    <div class="col-sm-10">';
        echo '      <h1 class="text-center post-title">';
        echo get_the_title(get_the_id());
        echo '      </h1>';
        echo '    </div>';
        echo '  </div>';

        // Set Content
        echo '  <div class="row justify-content-center mt-4 mb-4">';
        echo '    <div class="col-sm-10">';
        echo '    <div><span class="post-date">' . get_the_date() . '</span></div>';
        echo '    <div><span class="post-category">' . get_the_category()[0]->cat_name . '</span></div>';
        the_content();
        echo '    </div>';
        echo '  </div>';

        echo '  <div class="row justify-content-center mt-4 mb-4 p-4">';
        echo '    <div class="col-5">';
        previous_post_link();
        echo '    </div>';
        echo '    <div class="col-5">';
        next_post_link();
        echo '    </div>';
        echo '  </div>';
        
        echo '</div>';

    	get_template_part('news-docsearch');

        // 関連記事
        echo '<div id="post-related" class="container">';
        /* Set Title */
        echo '  <div class="row justify-content-center mt-4 mb-4 p-4">';
        echo '    <div class="col-sm-10">';
        echo '      <h3 class="text-center post-title">関連記事</h3>';
        echo '    </div>';
        echo '  </div>';

        echo '  <div class="row justify-content-center mt-4 mb-4">';
        echo '    <div class="col-sm-10">';

        $categories = get_the_category($post->ID);
        $category_id = array();

        foreach($categories as $category):
            array_push($category_id, $category->cat_ID);
        endforeach ;

        $args = array(
            'post__not_in' => array($post->ID),
            'posts_per_page'=> 5,
            'category__in' => $category_id,
            'orderby' => 'rand',
        );
        $query = new WP_Query($args);

        echo '<ul class="list-group list-group-flush">';
        if( $query->have_posts() ):
            while ($query->have_posts()) : $query->the_post();
                // echo '<p>' . get_the_title() . '</p>';

                    echo '  <li class="list-group-item py-3">';
                    echo '    <a class="post-list-title" href="' . get_the_permalink(get_the_id()) . '">';
                    echo get_the_title(get_the_id());
                    echo '    </a>';
                    echo '  </li>';

            endwhile;
        else:
            echo '関連記事はありませんでした';
        endif;
        echo '</ul>';

        echo '    </div>';
        echo '  </div>';
        echo '</div>';

        wp_reset_postdata();

    endwhile; // End of the loop.
?>

<!-- <div class="row justify-content-center mt-4 mb-4">
    <div class="col-sm-10">

        <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

        <ins class="adsbygoogle"
            style="display:block"
            data-ad-client="ca-pub-4823694607611749"
            data-ad-slot="8992830520"
            data-ad-format="auto"
            data-full-width-responsive="true"></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>

    </div>
</div> -->

<?php get_footer(); ?>

