
package org.kares.jruby;

public class WorkerScript
{
    private final String script, fileName;

    public static WorkerScript forScript(final String script) {
        return new WorkerScript(script, null);
    }

    public static WorkerScript forFileName(final String fileName) {
        return new WorkerScript(null, fileName);
    }

    public static WorkerScript forScriptAndFileName(final String script, final String fileName) {
        return new WorkerScript(script, fileName);
    }

    private WorkerScript(final String script, final String fileName)
    {
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
        final StringBuilder sb = new StringBuilder("[");
        if (script != null) {
            sb.append("script: ").append(script);
        }
        if (fileName != null) {
            sb.append("fileName: ").append(fileName);
        }
        sb.append("]");

        return sb.toString();
    }
}
