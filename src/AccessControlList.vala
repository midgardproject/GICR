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
	 * The AccessControlList is an AccessControlPolicy representing a list of access
	 * control entries. 
	 *
	 * It is mutable before being set to the AccessControlManager
	 * and consequently defines methods to read and mutate the list i.e. to get, add
	 * or remove individual entries.
	 */
	public interface AccessControlList : Object, AccessControlPolicy {

		/**
		 * Gets every registered access control entry.
		 *
		 * Returns all access control entries present with this policy.
		 * This method is only guaranteed to return an AccessControlEntry if that
		 * AccessControlEntry has been assigned through this API.
		 *
		 * @return array of all {@link AccessControlEntry} objects present with this policy.
		 *
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract AccessControlEntry[] get_access_control_entries ();

		/**
		 * Registers an access control entry object to the registry.
		 *
		 * Adds an access control entry to this policy consisting of the specified
		 * principal and the specified privileges.
		 * This method returns true if this policy was modified, false otherwise.
		 *
		 * How the entries are grouped within the list is an implementation detail. An
		 * implementation may e.g. combine the specified privileges with those added by
		 * a previous call to addAccessControlEntry for the same Principal. However, a
		 * call to addAccessControlEntry for a given Principal can never remove a
		 * Privilege added by a previous call.
		 *
		 * The modification does not take effect until this policy has been set to a node
		 * by calling AccessControlManagerInterface::setPolicy() and
		 * save is performed.
		 *
		 * @param principal a Principal. TODO: FIXME define a type for this. JCR has javax.security.Principal
		 * @param privileges an array of {@link Privilege} objects.
		 * @return true if this policy was modify; false otherwise.
		 *
		 * @throws AccessControlException if the specified principal or any of the privileges
		 *                                                does not existor if some other access control related exception occurs.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract bool add_access_control_entry (Value principal, Privilege[] privileges);

		/**
		 * Removes the specified access control entry object from this policy.
		 *
		 * Only exactly those entries obtained through getAccessControlEntries can be
		 * removed. This method does not take effect until this policy has been re-set
		 * to a node by calling AccessControlManager.set_policy
		 * and save is performed.
		 *
		 * @param ace the {@link AccessControlEntry} to be removed.
		 * @return void
		 *
		 * @throws AccessControlException if the specified entry is not present on the specified node.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void remove_access_control_entry (AccessControlEntry ace);
	}
}
