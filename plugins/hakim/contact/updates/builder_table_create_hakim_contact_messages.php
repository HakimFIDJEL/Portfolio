<?php namespace Hakim\Contact\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateHakimContactMessages extends Migration
{
    public function up()
    {
        Schema::create('hakim_contact_messages', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('name', 40);
            $table->string('email', 100);
            $table->text('content');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('hakim_contact_messages');
    }
}
