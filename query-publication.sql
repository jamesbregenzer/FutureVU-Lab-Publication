/*========== PAGES =============*/

/* Find all page type with title and body content */
/* pages.csv */

Select t1.nid, t1.vid, t1.title, t2.body_value
from `node` as t1
left join `field_revision_body` as t2
ON t1.vid = t2.revision_id
where t1.type = 'page';

/* Find all page and tags */
/* page-tags.csv */
Select t1.nid, t1.vid, t1.title, ttd.name as tags
from `node` as t1
left join `taxonomy_index` as t2
ON t1.nid = t2.nid
left join `taxonomy_term_data` as ttd
ON ttd.tid = t2.tid
where t1.type = 'page';


/*========== POSTS =============*/

/* Find all page type with title and body content */
/* posts.csv */
Select t1.nid, t1.vid, t1.title, t2.body_value
from `node` as t1
left join `field_revision_body` as t2
ON t1.vid = t2.revision_id
where t1.type = 'post';

/* Find all post and tags */
/* post-tags.csv */
Select t1.nid, t1.vid, t1.title, ttd.name as tags
from `node` as t1
  left join `taxonomy_index` as t2
    ON t1.nid = t2.nid
  left join `taxonomy_term_data` as ttd
    ON ttd.tid = t2.tid
where t1.type = 'post';

/*========== BARISTA POSTS (only use this one if your site doesn't have any post but 'barista_post' =============*/

/* Find all page type with title and body content */
/* posts.csv */
Select t1.nid, t1.vid, t1.title, t2.body_value
from `node` as t1
  left join `field_revision_body` as t2
    ON t1.vid = t2.revision_id
where t1.type = 'barista_post';

/* Find all post and tags */
/* post-tags.csv */
Select t1.nid, t1.vid, t1.title, ttd.name as tags
from `node` as t1
  left join `taxonomy_index` as t2
    ON t1.nid = t2.nid
  left join `taxonomy_term_data` as ttd
    ON ttd.tid = t2.tid
where t1.type = 'barista_post';

/*========== PUBLICATION =============*/

/* Find all authors (first, initial, last, suffix, role) for a publication */
/* publication-authors.csv */
Select t1.nid,
t1.vid,
t1.title,
pafname.field_barista_pub_fname_value as fname,
painitials.field_barista_pub_initials_value as initial,
palname.field_barista_pub_lname_value as lname,
pasuffix.field_barista_pub_suffix_value as suffix,
paauthrole.field_barista_pub_authrole_value as authrole
from `node` as t1
left join `field_data_field_barista_publications_auths` as paauths
ON t1.vid = paauths.revision_id
left join `field_data_field_barista_pub_fname` as pafname
ON paauths.field_barista_publications_auths_revision_id = pafname.revision_id
left join `field_data_field_barista_pub_lname` as palname
ON paauths.field_barista_publications_auths_revision_id = palname.revision_id
left join `field_data_field_barista_pub_suffix` as pasuffix
ON paauths.field_barista_publications_auths_revision_id = pasuffix.revision_id
left join `field_data_field_barista_pub_initials` as painitials
ON paauths.field_barista_publications_auths_revision_id = painitials.revision_id
left join `field_data_field_barista_pub_authrole` as paauthrole
ON paauths.field_barista_publications_auths_revision_id = paauthrole.revision_id
where t1.type = 'publication';

/* Get all fields (attributes) for each publication type */
/* publications.csv */
Select t1.nid,
t1.vid,
t1.title as short_title,
ptitle.field_barista_publication_title_value as full_title,
ptype.field_barista_publication_type_value as p_type,
pyear.field_barista_publication_year_value as p_year,
pmonth.field_barista_publication_month_value as p_month,
pday.field_barista_publication_day_value as p_day,
pjourn.field_barista_publication_journ_value as p_journal,
pjournabb.field_barista_pub_journal_abbrev_value as p_abbrev,
pjournmed.field_barista_pub_journal_medium_value as p_medium,
ppagination.field_barista_pub_pagination_value as p_pagination,
pissue.field_barista_publication_issue_value as p_issue,
pvolume.field_barista_publication_volume_value as p_volumne,
ppublisher.field_barista_pub_publisher_value as p_publisher,
pabstract.body_value as p_abtract,
pnlmuid.field_barista_pub_nlmuid_value as p_nlmuid,
pdoi.field_barista_publication_doi_value as p_doi,
pissn.field_barista_publication_issn_value as p_issn,
ppmid.field_barista_publication_pmid_value as p_pmid,
ppii.field_barista_publication_pii_value as p_pii,
ppmcid.field_barista_publication_pmcid_value as p_pmcid,
pnihms.field_barista_publication_nihms_value as p_nihms,
pisbn.field_barista_publications_isbn_value as p_isbn
from `node` as t1
left join `field_data_field_barista_publication_title` as ptitle
ON t1.vid = ptitle.revision_id
left join `field_data_field_barista_publication_type` as ptype
ON t1.vid = ptype.revision_id
left join `field_data_field_barista_publication_year` as pyear
ON t1.vid = pyear.revision_id
left join `field_data_field_barista_publication_month` as pmonth
ON t1.vid = pmonth.revision_id
left join `field_data_field_barista_publication_day` as pday
ON t1.vid = pday.revision_id
left join `field_data_field_barista_publication_journ` as pjourn
ON t1.vid = pjourn.revision_id
left join `field_data_field_barista_pub_journal_abbrev` as pjournabb
ON t1.vid = pjournabb.revision_id
left join `field_data_field_barista_pub_journal_medium` as pjournmed
ON t1.vid = pjournmed.revision_id
left join `field_data_field_barista_pub_pagination` as ppagination
ON t1.vid = ppagination.revision_id
left join `field_data_field_barista_publication_issue` as pissue
ON t1.vid = pissue.revision_id
left join `field_data_field_barista_publication_volume` as pvolume
ON t1.vid = pvolume.revision_id
left join `field_data_field_barista_pub_publisher` as ppublisher
ON t1.vid = ppublisher.revision_id
left join `field_revision_body` as pabstract
ON t1.vid = pabstract.revision_id
left join `field_revision_field_barista_pub_nlmuid` as pnlmuid
ON t1.vid = pnlmuid.revision_id
left join `field_revision_field_barista_publication_doi` as pdoi
ON t1.vid = pdoi.revision_id
left join `field_revision_field_barista_publication_issn` as pissn
ON t1.vid = pissn.revision_id
left join `field_revision_field_barista_publication_pmid` as ppmid
ON t1.vid = ppmid.revision_id
left join `field_revision_field_barista_publication_pii` as ppii
ON t1.vid = ppii.revision_id
left join `field_revision_field_barista_publication_pmcid` as ppmcid
ON t1.vid = ppmcid.revision_id
left join `field_revision_field_barista_publication_nihms` as pnihms
ON t1.vid = pnihms.revision_id
left join `field_revision_field_barista_publications_isbn` as pisbn
ON t1.vid = pisbn.revision_id
where t1.type = 'publication';

/* Find all publication and tags */
/* publication-tags.csv */
Select t1.nid, t1.vid, t1.title, ttd.name as tags
from `node` as t1
  left join `taxonomy_index` as t2
    ON t1.nid = t2.nid
  left join `taxonomy_term_data` as ttd
    ON ttd.tid = t2.tid
where t1.type = 'publication';

/*========== PERSON =============*/

/* Find all attributes for Person type */
/* person.csv */
Select t1.nid, t1.vid, t1.title, t2.body_value as bio_about,
per_brief.field_brief_description_value as brief_description,
per_fname.field_first_name_value as first_name,
per_middle.field_middle_name_value as middle_name,
per_lname.field_last_name_value as last_name,
per_suffix.field_suffix_value as suffix,
per_email.field_email_email as email,
per_photo_url.uri as photo_url
from `node` as t1
left join `field_revision_body` as t2
ON t1.vid = t2.revision_id
left join `field_data_field_brief_description` as per_brief
ON t1.vid = per_brief.revision_id
left join `field_data_field_email` as per_email
ON t1.vid = per_email.revision_id
left join `field_data_field_first_name` as per_fname
ON t1.vid = per_fname.revision_id
left join `field_data_field_last_name` as per_lname
ON t1.vid = per_lname.revision_id
left join `field_data_field_middle_name` as per_middle
ON t1.vid = per_middle.revision_id
left join `field_data_field_suffix` as per_suffix
ON t1.vid = per_suffix.revision_id
left join `field_data_field_barista_person_photo` as per_photo
ON t1.vid = per_photo.revision_id
left join `file_managed` as per_photo_url
ON per_photo.field_barista_person_photo_fid = per_photo_url.fid
where t1.type = 'person';

/* Find all department (title and value) for person type */
/* person-departments.csv */
Select t1.nid,
t1.vid,
t1.title,
perdepart_depart.field_department_value as department_name,
perdepart_title.field_department_title_value as department_title
from `node` as t1
left join `field_data_field_title` as perdepart_many
ON t1.vid = perdepart_many.revision_id
left join `field_data_field_department` as perdepart_depart
ON perdepart_many.field_title_revision_id = perdepart_depart.revision_id
left join `field_data_field_department_title` as perdepart_title
ON perdepart_many.field_title_revision_id = perdepart_title.revision_id
where t1.type = 'person';

/* Find all phone numbers for person type */
/* person-phones.csv */
Select t1.nid,
t1.vid,
t1.title,
perphone_number.field_number_value as phone,
perphone_type.field_type_value as phone_type
from `node` as t1
left join `field_data_field_phone_numbers` as perphone_many
ON t1.vid = perphone_many.revision_id
left join `field_data_field_number` as perphone_number
ON perphone_many.field_phone_numbers_revision_id = perphone_number.revision_id
left join `field_data_field_type` as perphone_type
ON perphone_many.field_phone_numbers_revision_id = perphone_type.revision_id
where t1.type = 'person';

/* Find all person and tags */
/* person-tags.csv */
Select t1.nid, t1.vid, t1.title, ttd.name as tags
from `node` as t1
  left join `taxonomy_index` as t2
    ON t1.nid = t2.nid
  left join `taxonomy_term_data` as ttd
    ON ttd.tid = t2.tid
where t1.type = 'person';



