
package org.kares.jruby;

public class WorkerScript
{
    private final String id,script, fileName;

    public static WorkerScript forScript(final String id, final String script) {
        return new WorkerScript(id,script, null);
    }

    public static WorkerScript forFileName(final String id,final String fileName) {
        return new WorkerScript(id,null, fileName);
    }

    public static WorkerScript forScriptAndFileName(final String id,final String script, final String fileName) {
        return new WorkerScript(id,script, fileName);
    }

    private WorkerScript(final String id,final String script, final String fileName)
    {
        this.id=id;
        this.script = script;
        this.fileName = fileName;
    }

    public String getScript()
    {
        return script;
    }

    public String getFileName()
    {
        return fileName;
    }

    @Override
    public String toString()
    {
        return id;
    }
}
