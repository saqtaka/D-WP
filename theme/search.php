<?php get_header(); ?>

<!-- <h2 class="text-center m-2 p-2">検索結果</h2> -->
<div id="post-list" class="container">
    <div class="row justify-content-center mt-4 mb-4 p-4">
		<div class="col-sm-10">
			<?php
				if ( have_posts() ) {

					echo '<ul class="list-group list-group-flush">';

					// Load posts loop.
					while ( have_posts() ) {
						the_post();

						echo '  <li class="list-group-item py-3">';
						echo '    <a class="post-list-title" href="' . get_the_permalink(get_the_id()) . '">';
						echo get_the_title(get_the_id());
						echo '    </a>';
						echo '  </li>';
							
					}
					echo '</ul>';
					// echo '</div>';
				} else {
					echo '<p>No posts found</p>';
				}
			?>
		</div>
	</div><!-- row justify-content-center -->

	<div class="row justify-content-center mt-4 mb-4 p-4">
	    <div class="col-sm-10 text-center">
			<?php 
				global $wp_query;
				$big = 999999999; // need an unlikely 

				echo paginate_links( array(
				'base' => str_replace( $big, '%#%', esc_url( get_pagenum_link( $big ) ) ),
				'format' => '?paged=%#%',
				'current' => max( 1, get_query_var('paged') ),
				'total' => $wp_query->max_num_pages
				) ) 
			?>
		</div>
	</div>
</div><!-- container -->

<?php get_footer(); ?>
