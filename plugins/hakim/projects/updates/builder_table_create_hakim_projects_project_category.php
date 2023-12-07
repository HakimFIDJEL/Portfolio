<?php namespace Hakim\Projects\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateHakimProjectsProjectCategory extends Migration
{
    public function up()
    {
        Schema::create('hakim_projects_project_category', function($table)
        {
            $table->increments('id')->unsigned();
            $table->integer('project_id');
            $table->integer('category_id');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('hakim_projects_project_category');
    }
}
