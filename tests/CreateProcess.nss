/* void CreateProcess(Handle, unk, unk, unk, Symbol) */

#include "nss/libtest.nss"

chapter main
{
    TestRequest();
    TestExecOrder();
    Exit();
}

function TestRequest()
{
    CreateProcess("proc1", 0, 0, 0, "Foo");
    WaitKey();
    Request("proc1", "Start");
    WaitKey();
    Request("proc1", "Pause");
    WaitKey();
    Request("proc1", "Resume");
    WaitKey();
    Delete("proc1");
}

function Foo()
{
    while (1)
    {
        CreateColor("color", 1, 0, 0, 1024, 576, "red");
        Wait(500);
        Delete("color");
        Wait(500);
    }
}

function TestExecOrder()
{
    CreateProcess("proc2", 0, 0, 0, "Bar");
    $tm = Time();
    Request("proc2", "Start");
    while (Time() - $tm < 2)
    {
        Print("foo");
    }
    Delete("proc2");
}

function Bar()
{
    while (1)
    {
        Print("bar");
    }
}
