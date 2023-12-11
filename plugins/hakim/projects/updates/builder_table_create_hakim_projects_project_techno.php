<?php namespace Hakim\Projects\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateHakimProjectsProjectTechno extends Migration
{
    public function up()
    {
        Schema::create('hakim_projects_project_techno', function($table)
        {
            $table->increments('id')->unsigned();
            $table->integer('project_id');
            $table->smallInteger('techno_id');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('hakim_projects_project_techno');
    }
}
