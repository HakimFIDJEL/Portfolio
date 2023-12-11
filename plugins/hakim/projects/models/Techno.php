<?php namespace Hakim\Projects\Models;

use Model;

/**
 * Model
 */
class Techno extends Model
{
    use \October\Rain\Database\Traits\Validation;

    /**
     * @var bool timestamps are disabled.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;

    /**
     * @var string table in the database used by the model.
     */
    public $table = 'hakim_projects_technos';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

    public $belongsToMany = [
        'projects' => [
            'Hakim\Projects\Models\Project',
            'table' => 'hakim_projects_project_techno',
            'key' => 'techno_id',
            'otherKey' => 'project_id',
        ]
    ];

}
