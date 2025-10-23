<?php
/*
Theme Name: Cloudboosta Corporate
Description: A professional theme for Cloudboosta - Leading Cloud Service Provider. Features a modern hero section and cloud services showcase.
Version: 1.0
Author: Cloudboosta Development Team
*/

// Theme setup
function cloudboosta_theme_setup() {
    add_theme_support('title-tag');
    add_theme_support('post-thumbnails');
}
add_action('after_setup_theme', 'cloudboosta_theme_setup');

// Enqueue styles
function cloudboosta_scripts() {
    wp_enqueue_style('cloudboosta-style', get_stylesheet_uri());
}
add_action('wp_enqueue_scripts', 'cloudboosta_scripts');
?>