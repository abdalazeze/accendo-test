<?php

class RoleUserSynchronization
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
