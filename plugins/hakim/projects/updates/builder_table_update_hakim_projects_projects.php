<?php namespace Hakim\Projects\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateHakimProjectsProjects extends Migration
{
    public function up()
    {
        Schema::table('hakim_projects_projects', function($table)
        {
            $table->string('src');
        });
    }
    
    public function down()
    {
        Schema::table('hakim_projects_projects', function($table)
        {
            $table->dropColumn('src');
        });
    }
}
