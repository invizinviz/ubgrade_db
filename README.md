#CodeTest

* A database upgrade requires the execution of numbered scripts stored in a folder. E.g 045.createtable.sql
* There may be holes in the numbering and there isn't always a . after the number.
* The database upgrade works by looking up the current version in the database. It compares this number to the scripts. If the number from the db matches the highest number script then nothing is run. If the number from the db is lower than all the scripts from that number are executed.
* In addition the version table is updated after the install.


to run test 
```bash
rspec upgrade_test.rb
```

```bash
./upgrade.rb -d 46 -f "scripts"

use ./upgrade.rb -h to get more information
```