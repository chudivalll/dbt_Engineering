
-- Welcome to your first dbt model!
-- Did you know that you can also configure models directly within
-- the SQL file? This will override configurations stated in dbt_project.yml

-- Try changing 'view' to 'table', then re-running dbt
{{ config(materialized='view') }}


with posts as (
    select
        id,
        post_author,
        post_date,
        post_date_gmt,
        post_status,
        comment_status,
        ping_status,
        post_modified,
        post_parent,
        guid,
        menu_order,
        post_type,
        comment_count,
        prefix
    from {{ ref('abc_posts') }}
    union
    select
        id,
        post_author,
        post_date,
        post_date_gmt,
        post_status,
        comment_status,
        ping_status,
        post_modified,
        post_parent,
        guid,
        menu_order,
        post_type,
        comment_count,
        prefix
    from {{ ref('aks_posts') }}
    union
    select
        id,
        post_author,
        post_date,
        post_date_gmt,
        post_status,
        comment_status,
        ping_status,
        post_modified,
        post_parent,
        guid,
        menu_order,
        post_type,
        comment_count,
        prefix
    from {{ ref('alz_posts') }}
    union
    select
        id,
        post_author,
        post_date,
        post_date_gmt,
        post_status,
        comment_status,
        ping_status,
        post_modified,
        post_parent,
        guid,
        menu_order,
        post_type,
        comment_count,
        prefix
    from {{ ref('cf_posts') }}
    union
    select
        id,
        post_author,
        post_date,
        post_date_gmt,
        post_status,
        comment_status,
        ping_status,
        post_modified,
        post_parent,
        guid,
        menu_order,
        post_type,
        comment_count,
        prefix
    from {{ ref('macd_posts') }}

)

select * from posts



