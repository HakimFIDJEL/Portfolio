<?php namespace Hakim\Projects\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateHakimProjectsCategories extends Migration
{
    public function up()
    {
        Schema::rename('hakim_projects_category', 'hakim_projects_categories');
    }
    
    public function down()
    {
        Schema::rename('hakim_projects_categories', 'hakim_projects_category');
    }
}
