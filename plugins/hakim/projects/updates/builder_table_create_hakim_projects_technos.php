<?php namespace Hakim\Projects\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateHakimProjectsTechnos extends Migration
{
    public function up()
    {
        Schema::create('hakim_projects_technos', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('name', 100);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('hakim_projects_technos');
    }
}
