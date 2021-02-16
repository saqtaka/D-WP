<?php get_header(); ?>

<?php
	get_template_part('functions/fudousan');
	get_template_part('news');
?>

<!-- <h2 class="text-center m-2 p-2">新着記事</h2> -->
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
						echo '    <div>';
						echo '    <span class="post-list-date">' . get_the_date() . '</span>';
						echo '    <div>';
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

<div id="post-list" class="container">
    <div class="row justify-content-center mt-4 mb-4 p-4">
		<div class="col-sm-10">
			<form class="form-inline my-2 my-lg-0" method="get" action="<?php echo home_url(); ?>/">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="s">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</div>
</div><!-- container -->

<!-- <div class="row justify-content-center mt-4 mb-4">
    <div class="col-sm-10">


		<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

		<ins class="adsbygoogle"
			style="display:block"
			data-ad-client="ca-pub-4823694607611749"
			data-ad-slot="4476365357"
			data-ad-format="auto"
			data-full-width-responsive="true"></ins>
		<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
		</script>

	</div>
</div> -->

<?php get_footer(); ?>


