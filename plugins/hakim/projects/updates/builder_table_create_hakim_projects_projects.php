<?php namespace Hakim\Projects\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateHakimProjectsProjects extends Migration
{
    public function up()
    {
        Schema::create('hakim_projects_projects', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('name', 100);
            $table->text('subtitle');
            $table->text('libelle');
            $table->text('description');
            $table->text('first_question');
            $table->text('first_answer');
            $table->text('second_question');
            $table->text('second_answer');
            $table->integer('grade');
            $table->text('grade_text');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('hakim_projects_projects');
    }
}
