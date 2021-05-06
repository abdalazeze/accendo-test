<?php
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
class SyncSynchronization
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
        Schema::dropIfExists('synchronizations');
    }
}
