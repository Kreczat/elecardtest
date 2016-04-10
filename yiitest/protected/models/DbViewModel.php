<?php
/**
 * Class DbViewModel
 * @property CDbConnection $connection
 */
class DbViewModel
{
    private $connection;
    private $dbName;
    public function __construct()
    {
        $this->connection=Yii::app()->db;
        preg_match("/dbname=([^;]*)/", $this->connection->connectionString, $matches);
        $this->dbName = $matches[1];
    }

    /**
     * Get all db views
     * @return array
     */
    public function getViewList()
    {
        $sql = "SHOW FULL TABLES IN " . $this->dbName . " WHERE TABLE_TYPE LIKE 'VIEW'";
        $command=$this->connection->createCommand($sql);
        $res=$command->queryAll();
        $viewList = [];
        foreach($res as $row){
            $viewList[] = $row['Tables_in_testdb'];
        }
        return $viewList;
    }

    /**
     * Get name of all fields
     * @param string $viewName
     * @return array|CDbDataReader
     */
    public function getColumnsByViewName($viewName)
    {
        $sql = "SHOW COLUMNS FROM " . $viewName;
        $command=$this->connection->createCommand($sql);
        return $command->queryAll();
    }

    /**
     * Get all data from view
     * @param string $viewName
     * @return array|CDbDataReader
     */
    public function getDataByViewName($viewName/*, $offset , $limit*/)
    {
        //$sql = sprintf("SELECT * FROM %s LIMIT %d, %d", $viewName, $offset, $limit);
        $sql = sprintf("SELECT * FROM %s", $viewName);
        $command=$this->connection->createCommand($sql);
        return $command->queryAll();
    }
    /*public function getCountByViewName($viewName)
    {
        $sql = "SELECT count(*) FROM " . $viewName;
        $command=$this->connection->createCommand($sql);
        $res = $command->query();
    }*/
}