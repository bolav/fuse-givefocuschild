using Uno;
using Uno.UX;

using Fuse;
using Fuse.Input;
using Fuse.Controls;
using Fuse.Triggers.Actions;

public sealed class GiveFocusChild: TriggerAction
{
	public Visual Target { get; set; }

	protected override void Perform(Node target)
	{
		var _target = Target ?? target as Visual;
		if (_target is Panel) {
			var p = _target as Panel;
			_target = p.Children[0] as Visual;
		}
		Focus.GiveTo(_target);
	}

	[UXGlobalResource("GiveFocusChild")] public static readonly TriggerAction Singleton = new GiveFocusChild();
}
