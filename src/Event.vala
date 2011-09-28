/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	/**
	 * An event fired by the observation mechanism.
	 */
	public interface Event : Object {

		/**
		 * Generated on persist when a node is added.
		 * * get_path returns the absolute path of the node that was added.
		 * * get_identifier returns the identifier of the node that was added.
		 * * get_info returns an empty array
		 */
		public const int NODE_ADDED = 0x1;

		/**
		 * Generated on persist when a node is removed.
		 * * get_path returns the absolute path of the node that was removed.
		 * * get_identifier returns the identifier of the node that was removed.
		 * * get_info returns an empty array
		 */
		public const int NODE_REMOVED = 0x2;

		/**
		 * Generated on persist when a property is added.
		 * * get_path returns the absolute path of the property that was added.
		 * * get_identifier returns the identifier of the parent node of the property that was added.
		 * * get_info returns an empty array
		 */
		public const int PROPERTY_ADDED = 0x4;

		/**
		 * Generated on persist when a property is removed.
		 * * get_path returns the absolute path of the property that was removed.
		 * * get_identifier returns the identifier of the parent node of the property that was removed.
		 * * get_info returns an empty array
		 */
		public const int PROPERTY_REMOVED = 0x8;

		/**
		 * Generated on persist when a property is changed.
		 * * get_path returns the absolute path of the property that was changed.
		 * * get_identifier returns the identifier of the parent node of the property that was changed.
		 * * get_info returns an empty array
		 */
		public const int PROPERTY_CHANGED = 0x10;

		/**
		 * Generated on persist when a node is moved.
		 * * get_path returns the absolute path of the destination of the move.
		 * * get_identifier returns the identifier of the moved node.
		 * * get_info If the method that caused this event was a
		 * Session.move or Workspace.move then the
		 * returned array has keys srcAbsPath and destAbsPath with values
		 * corresponding to the parameters passed to the move method.
		 * If the method that caused this event was a Node.order_before
		 * then the returned aray has keys srcChildRelPath and destChildRelPath
		 * with values corresponding to the parameters passed to the order_before
		 * method.
		 */
		public const int NODE_MOVED = 0x20;

		/**
		 * If event bundling is supported, this event is used to indicate a
		 * bundle boundary within the event journal.
		 * * get_path returns null.
		 * * get_identifier returns null.
		 * * get_info returns an empty array.
		 */
		public const int PERSIST = 0x40;

		/**
		 * Returns the type of this event: a constant defined by this interface.
		 * One of:
		 * * NODE_ADDED
		 * * NODE_REMOVED
		 * * PROPERTY_ADDED
		 * * PROPERTY_REMOVED
		 * * PROPERTY_CHANGED
		 * * NODE_MOVED
		 * * PERSIST
		 * @return the type of this event.
		 */
		public abstract int get_type ();

		/**
		 * Returns the absolute path associated with this event or null if this
		 * event has no associated identifier.
		 * The meaning of the associated path depends upon the type of the event.
		 * See event type constants above.
		 * @return The absolute path associated with this event or null.
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract string get_path ();

		/**
		 * Returns the user ID connected with this event.
		 * This is the string returned by Session.get_user_id of the session that caused the event.
		 * @return The identifier of the user connected to the event.
		 */
		public abstract string get_user_id ();

		/**
		 * Returns the identifier associated with this event or null if this event
		 * has no associated identifier.
		 * The meaning of the associated identifier depends upon the type of the event.
		 * See event type constants above.
		 * @return The identifier associated with this event or null.
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract string get_identifier ();

		/**
		 * Returns the information map associated with this event.
		 * The meaning of the map depends upon the type of the event.
		 * See event type constants above.
		 * @return FIXME containing parameter information for instances of a NODE_MOVED event.
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract void get_info ();

		/**
		 * Returns the user data set through ObservationManager.set_user_data on the
		 * ObservationManager bound to the Session that caused the event.
		 * @return The user data string.
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract string get_user_data ();

		/**
		 * Returns the date when the change was persisted that caused this event.
		 * The date is represented as a millisecond value that is an offset from the
		 * Epoch, January 1, 1970 00:00:00.000 GMT (Gregorian). The granularity of
		 * the returned value is implementation dependent.
		 * @return The date when the change was persisted that caused this event (milliseconds since epoch).
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract int get_date ();
	}
}
