<?php

$flag = 'aaa';

class B {
  function __destruct() {
    global $flag;
    echo $flag;
  }
}

$b = new B();

echo(serialize($b));
