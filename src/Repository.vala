
namespace GICR {

	public errordomain RepositoryError {
		INTERNAL
	}

	public interface Repository : GLib.Object {

		public abstract login ();
		public abstract logout ();
			
	}
}

