<?php namespace Hakim\Projects\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateHakimProjectsCategory extends Migration
{
    public function up()
    {
        Schema::create('hakim_projects_category', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('description', 100);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('hakim_projects_category');
    }
}
