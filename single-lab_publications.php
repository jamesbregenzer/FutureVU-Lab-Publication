<?php
/*
 * Template Name: Lab Publication Page
 */

get_header(); ?>

    <div class="panel panel-default col-sm-9">
        <div class="row">
            <article class="primary-content col-sm-12">
                <div class="panel-body">
                    <?php if (have_posts()) : while (have_posts()) : the_post(); ?>

                        <?php edit_post_link( __( 'Edit', 'vanderbilt_brand' ), '<span class="edit-link">', '</span>' ); ?>

                        <h3 class="pagetitle"> <?php the_field('full_title'); ?> </h3>
                        <hr />

                        <h3>AUTHORS</h3>
                        <?php
                        //check for author repeater
                        if(have_rows('authors')):
                        		$number_authors = count(get_field('authors'));
                        		$author_counter = 1;
                            ?>
                            <div class="well">
                                <?php
                                //loop through authors
                                while(have_rows('authors')): the_row(); ?>
                                    <?php
                                    the_sub_field('last_family_name'); ?>

                                    <?php
                                    if(get_sub_field('initials')) {
                                        the_sub_field('initials');
                                    } 
                                        the_sub_field('first_given_name');
                                                                        
                                    ?>
                                    <?php
	                                    if ($author_counter == $number_authors) {
		                                    echo ".";
	                                    } else {
		                                    echo ", ";
	                                    }
	                                    $author_counter++;
                                    ?>
                                    
                                <?php endwhile; ?>
                                
                                <?php if (get_field('book_title')): ?>
                                	<?php the_field('book_title') ?>.
                                <?php endif; ?>
                                
                                <?php if (get_field('journal_title')): ?> 
	                                <?php the_field('journal_title'); ?>. <?php the_field('year'); ?> <?php the_field('month'); ?> <?php the_field('day'); ?>; <?php the_field('volume'); ?>(<?php the_field('issue_number'); ?>). 
								<?php endif; ?>
								
                                <?php the_field('pagination'); ?>

                                <ul>
                                    <?php if(get_field('pmid')): ?>
                                        <li>PMID: <a href="https://www.ncbi.nlm.nih.gov/pubmed/<?php the_field('pmid') ?>"><?php the_field('pmid'); ?>[PubMed]</a>. </li>
                                    <?php endif; ?>
                                    <?php if(get_field('pmcid')): ?>
                                        <li>PMCID: <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/<?php the_field('pmcid') ?>"> <?php the_field('pmcid'); ?></a>. </li>
                                    <?php endif; ?>
                                    <?php if(get_field('nihmsid')): ?>
                                        <li>NIHMSID: <?php the_field('nihmsid'); ?> </li>
                                    <?php endif; ?>
                                </ul>
                            </div>
                        <?php endif; ?>

                        <h3>ABSTRACT</h3>

                        <?php // the_post_thumbnail(array(200,200), array("class" => "left")); ?>
                        <?php $image = get_field('decorative_image');
                            if($image){

                                $url = $image['url'];
                                $title = $image['title'];
                                $alt = $image['alt'];
                                $caption = $image['caption'];

                                $size = 'large';
                                $full_img = $image['sizes'][$size];

                                //echo wp_get_attachment_image($image, $size);
                            }
                        ?>
                        <?php if($image): ?>
                            <img src="<?php echo $full_img; ?>" alt="<?php echo $alt; ?>" />
                        <?php endif; ?>

                        <?php

                            the_field('abstract');
                        ?>

                        <hr />





                        <div class="">
                            <?php the_content(); ?>
                        </div>



                        <hr />
                        <?php the_tags( '<p>Tags: ', ', ', '</p>'); ?>


                        <?php if (get_theme_mod('socialsharelinks') == true) { ?>
                            <div class="addthis_sharing_toolbox"></div>
                        <?php } ?>

                        <?php comments_template(); ?>


                    <?php endwhile; else: ?>

                        <p>Sorry, no posts matched your criteria.</p>

                    <?php endif; ?>

                </div>
            </article>
        </div>
    </div>

<?php wp_reset_query(); ?>

<?php get_sidebar(); ?>
<?php get_footer(); ?>