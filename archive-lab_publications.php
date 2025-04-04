<?php
/**
 * @package WordPress
 * @subpackage vanderbilt brand
 */

get_header();
?>
<div class="panel panel-default col-sm-9">
    <div class="row">
        <article class="primary-content col-sm-12">
            <div class="panel-body">
                <?php $blog_details = get_blog_details();

                ?>
                <h2> <?php echo _($blog_details->blogname); ?> Publications </h2>
                <?php
                //query trees_of_VU post type
                $args = array (
                    'post_type'    =>  'Publication',
                    'depth'          => 1,
                    'posts_per_page' => -1,
                    'meta_key' => 'year',
                    'orderby'   => array('meta_value_num'=>'DESC', 'post_date' => 'DESC'),
                    //'order' => 'DESC'
                );

                $wp_query = new WP_Query($args);

                $previous_year = 0;
                ?>

                <?php if($wp_query->have_posts()):
                    while($wp_query->have_posts()):

                        $wp_query->the_post();
                        ?>
                        <?php
                            //set value for previous year
                            if($previous_year != get_field('year')):
                                $previous_year = get_field('year');
                        ?>

                                <h3><?php the_field('year'); ?></h3>

                        <?php endif; ?>

                        <div class="well">
                            <div class="media">
                                <div class="media-left">

                                    <?php $image = get_field('decorative_image');
                                    if($image){

                                        $url = $image['url'];
                                        $title = $image['title'];
                                        $alt = $image['alt'];
                                        $caption = $image['caption'];

                                        $size = 'thumbnail';
                                        $sized_img = $image['sizes'][$size];

                                    }
                                    ?>
                                    <?php if($image): ?>
                                        <a href="<?php the_permalink(); ?>"> <img src="<?php echo $sized_img; ?>" alt="<?php echo $alt; ?>" /> </a>
                                    <?php else: ?>
                                        <i style="width: 20px; height: 20px; color: #cdcdcd;" class="fa fa-file-text" aria-hidden="true"></i>
                                    <?php endif; ?>

                                </div>

                                <div class="media-body">
                                    <?php
                                    //loop through authors
                                    while(have_rows('authors')): the_row(); ?>
                                        <?php
                                        the_sub_field('last_family_name'); ?>

                                        <?php
                                        if(get_sub_field('initials')) {
                                            the_sub_field('initials');
                                        } else {
                                            the_sub_field('first_given_name');
                                        }
                                        ?>
                                        ,
                                    <?php endwhile; ?>
                                    <strong> <a href="<?php the_permalink(); ?>" > <?php the_title(); ?> </a> </strong>

                                    <?php if (get_field('book_title')): ?>
                                        <?php the_field('book_title') ?>.
                                    <?php endif; ?>

                                    <?php if (get_field('journal_title')): ?>
                                        <?php the_field('journal_title'); ?>.
                                    <?php endif; ?>

                                    <?php the_field('year'); ?>
                                    <?php if(get_field('month')): ?>
                                        <?php switch (get_field('month')) {
                                            case '1' :
                                                echo 'Jan';
                                                break;
                                            case '2' :
                                                echo 'Feb';
                                                break;
                                            case '3' :
                                                echo 'Mar';
                                                break;
                                            case '4':
                                                echo 'Apr';
                                                break;
                                            case '5':
                                                echo 'May';
                                                break;
                                            case '6':
                                                echo 'Jun';
                                                break;
                                            case '7':
                                                echo 'Jul';
                                                break;
                                            case '8':
                                                echo 'Aug';
                                                break;
                                            case '9':
                                                echo 'Sep';
                                                break;
                                            case '10':
                                                echo 'Oct';
                                                break;
                                            case '11':
                                                echo 'Nov';
                                                break;
                                            case '12':
                                                echo 'Dec';
                                                break;
                                            }
                                        ?>
                                    <?php endif; ?>

                                    <?php the_field('day'); ?>;

                                    <?php if(get_field('volume')): ?>
                                        <?php the_field('volume'); ?>
                                    <?php endif; ?>

                                    <?php if(get_field('issue_number')): ?>
                                        (<?php the_field('issue_number'); ?>).
                                    <?php endif; ?>

                                    <?php if(get_field('pagination')): ?>
                                        <?php the_field('pagination'); ?>
                                    <?php endif; ?>

                                    <ul style="margin-top: 10px;" class="">
                                        <?php if(get_field('pmid')): ?>
                                            <li>PMID: <a href="https://www.ncbi.nlm.nih.gov/pubmed/<?php the_field('pmid') ?>" target="_blank"> <?php the_field('pmid'); ?> [PubMed]</a>. </li>
                                        <?php endif; ?>
                                        <?php if(get_field('pmcid')): ?>
                                            <li>PMCID: <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/<?php the_field('pmcid') ?>" target="_blank"> <?php the_field('pmcid'); ?></a>. </li>
                                        <?php endif; ?>
                                        <?php if(get_field('nihmsid')): ?>
                                            <li>NIHMSID: <?php the_field('nihmsid'); ?> </li>
                                        <?php endif; ?>
                                    </ul>
                                </div>
                            </div>


                        </div>


                    <?php endwhile;
                endif;
                ?>
                <?php wp_reset_query(); ?>
            </div>
        </article>
    </div>
</div>

<?php get_sidebar(); ?>
<?php get_footer(); ?>
