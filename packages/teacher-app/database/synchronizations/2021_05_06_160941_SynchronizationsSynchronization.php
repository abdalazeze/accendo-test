<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
class SynchronizationsSynchronization
{
    /**
     * When enabled prevents data loss on encountering exceptions
     *
     * @var boolean
     */
    public $withTransactions = true;

    /**
     * Run the synchronization.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('synchronizations', function (Blueprint $table) {
            $table->increments('id');
            $table->string('synchronization')->nullable(false);
            $table->unsignedInteger('batch')->default(1);
        });
    }

    /**
     * Rollback the synchronization.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
