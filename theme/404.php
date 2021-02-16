<?php get_header(); ?>

<div id="post-list" class="container">
    <div class="row justify-content-center mt-4 mb-4 p-4">
		<div class="col-sm-10">
            <p class="p-2 m-2">Oops! That page can’t be found.</p>
			<form class="form-inline my-2 my-lg-0" method="get" action="<?php echo home_url(); ?>/">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="s">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</div>
</div><!-- container -->

<?php get_footer(); ?>
