<?php namespace Hakim\Projects\Models;

use Model;

/**
 * Model
 */
class Project extends Model
{
    use \October\Rain\Database\Traits\Validation;

    
    /**
     * @var string table in the database used by the model.
     */
    public $table = 'hakim_projects_projects';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

    public $belongsToMany = [
        'categories' => [
            'Hakim\Projects\Models\Category',
            'table' => 'hakim_projects_project_category',
            'key'=>'project_id',
            'otherKey'=>'category_id',
        ]
    ];

    

    

   
    public $attachMany = [
        'images' => ['System\Models\File']
    ];

}
