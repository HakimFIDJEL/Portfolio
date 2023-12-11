<?php namespace Hakim\Contact\Models;

use Model;

/**
 * Model
 */
class Message extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'hakim_contact_messages';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

}
