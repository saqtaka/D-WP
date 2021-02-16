<?php get_header(); ?>

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
        the_content();
        echo '    </div>';
        echo '  </div>';

        // echo '  <div class="row justify-content-center mt-4 mb-4 p-4">';
        // echo '    <div class="col-5">';
        // previous_post_link();
        // echo '    </div>';
        // echo '    <div class="col-5">';
        // next_post_link();
        // echo '    </div>';
        // echo '  </div>';
        
        echo '</div>';

    endwhile; // End of the loop.
?>

<?php get_footer(); ?>
