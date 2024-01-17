<?php namespace Hakim\Projects\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateHakimProjectsProjectsParallax extends Migration
{
    public function up()
    {
        Schema::create('hakim_projects_projects_parallax', function($table)
        {
            $table->increments('id')->unsigned();
            $table->integer('project_id');
            $table->string('description', 100);
            $table->text('src');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('hakim_projects_projects_parallax');
    }
}
