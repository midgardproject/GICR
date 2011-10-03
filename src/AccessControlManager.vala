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
	 * The AccessControlManager object is accessed via Session.get_access_control_manager.
 	 *
	 * It provides methods for:
	 * * Access control discovery
	 * * Assigning access control policies
	 */
	public interface AccessControlManager : Object {

		/**
		 * Gets previleges of an existing node identified by its path.
		 *
		 * Returns the privileges supported for absolute path absPath, which must
		 * be an existing node.
		 * This method does not return the privileges held by the session. Instead,
		 * it returns the privileges that the repository supports.
		 *
		 * @param absPath The absolute path to a node the prvileges shall be fetched of.
		 * @return An array of {@link Privilege} objects.
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have
		 *                                      privilege to retrieve the node.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract Privilege[] get_supported_privileges (string absPath);

		/**
		 * Returns the privilege with the specified privilegeName.
		 *
		 * @param privilegeName The name of an existing privilege.
		 * @return the {@link Privilege} with the specified privilegeName.
		 *
		 * @throws AccessControlException if no privilege with the specified name exists.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract Privilege privilege_from_name (string privilegeName);

		/**
		 * Determines if the node identified its path has the given set of previleges.
		 *
		 * Returns whether the session has the specified privileges for absolute
		 * path absPath, which must be an existing node.
		 * Testing an aggregate privilege is equivalent to testing each non aggregate
		 * privilege among the set returned by calling Privilege.get_aggregate_privileges
		 * for that privilege.
		 *
		 * The results reported by the this method reflect the net effect of the
		 * currently applied control mechanisms. It does not reflect unsaved access
		 * control policies or unsaved access control entries. Changes to access
		 * control status caused by these mechanisms only take effect on Session.save
		 * and are only then reflected in the results of the privilege test methods.
		 *
		 * @param absPath The absolute path to a node the prvileges shall be fetched of.
		 * @param array of {@link Privilege} objects.
		 * @return true if the session has the specified privileges; false otherwise.
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have
		 *                                      sufficent access to retrieve a node at that location.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract bool has_privileges (string absPath, Privilege[] privileges);

		/**
		 * Reads the previleges of an existing node identfied by its path.
		 *
		 * Returns the privileges the session has for absolute path absPath, which
		 * must be an existing node.
		 * The returned privileges are those for which has_privileges() would
		 * return true.
		 *
		 * The results reported by the this method reflect the net effect of the
		 * currently applied control mechanisms. It does not reflect unsaved access
		 * control policies or unsaved access control entries. Changes to access
		 * control status caused by these mechanisms only take effect on
		 * Session.save and are only then reflected in the results of
		 * the privilege test methods.
		 *
		 * @param absPath The absolute path to a node the prvileges shall be fetched of.
		 * @return an array of {@link Privilege} objects.
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have sufficent access to retrieve a node at that location.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract Privilege[] get_privileges (string absPath);

		/**
		 * Gets the access control policies previouly set to the node identified by the given path.
		 *
		 * Returns the AccessControlPolicy objects that have been set to the node at
		 * absPath or an empty if no policy has been set. This method reflects
		 * the binding state, including transient policy modifications.
		 * Use get_effective_policies() in order to determine the policy that
		 * effectively applies at absPath.
		 *
		 * @param absPath The absolute path to a node the prvileges shall be fetched of.
		 * @return an array of {@link AccessControlPolicy} objects or an empty if no policy has been set.
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have sufficent
		 *                                      access to retrieve a node at that location.
		 * @throws AccessDeniedException if the session lacks READ_ACCESS_CONTROL privilege for the absPath node.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract AccessControlPolicy[] get_policies (string absPath);

		/**
		 * Gets the access control policies currently in effect on the node identified by the given path.
		 *
		 * Returns the AccessControlPolicy objects that currently are in effect at
		 * the node at absPath. This may be policies set through this API or some
		 * implementation specific (default) policies.
		 *
		 * @param absPath The absolute path to a node the prvileges shall be fetched of.
		 * @return an array of {@link AccessControlPolicy} objects.
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have
		 *                                      sufficent access to retrieve a node at that location.
		 * @throws AccessDeniedException if the session lacks READ_ACCESS_CONTROL privilege for the absPath node.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract AccessControlPolicy[] get_effective_policies (string absPath);

		/**
		 * Returns the access control policies that are capable of being applied to
		 * the node at absPath.
		 *
		 * @param absPath The absolute path to a node the prvileges shall be fetched of.
		 * @return an array of {@link AccessControlPolicy} objects.
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have sufficent
		 *                                      access to retrieve a node at that location.
		 * @throws AccessDeniedException if the session lacks READ_ACCESS_CONTROL privilege for the absPath node.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract AccessControlPolicy[] get_applicable_policies (string absPath);

		/**
		 * Binds the policy to the node at absPath.
		 *
		 * The behavior of the call acm.set_policy(absPath, policy) differs depending
		 * on how the policy object was originally acquired.
		 *
		 * If policy was acquired through acm->getApplicablePolicies(absPath) then
		 * that policy object is added to the node at absPath.
		 *
		 * On the other hand, if policy was acquired through
		 * acm.get_policies(absPath) then that policy object (usually after being
		 * altered) replaces its former version on the node at absPath.
		 *
		 * This is session-write method and therefore the access control policy
		 * is only dispatched on save() and will only take effect upon
		 * persist.
		 *
		 * @param absPath The absolute path to a node the prvileges shall be fetched of.
		 * @param The {@link AccessControlPolicy} to be applied.
		 * @return void
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have sufficent
		 *                                      access to retrieve a node at that location.
		 * @throws AccessControlException if the policy is not applicable.
		 * @throws AccessDeniedException if the session lacks MODIFY_ACCESS_CONTROL privilege for the absPath node.
		 * @throws LockException if a lock applies at the node at absPath and this implementation performs
		 *                                   this validation immediately instead of waiting until save.
		 * @throws VersionException if the node at absPath is read-only due to a checked-in node and
		 *                                         this implementation performs this validation immediately.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void set_policy (string absPath, AccessControlPolicy policy);

		/**
		 * Removes the specified AccessControlPolicy from the node at absPath.
		 *
		 * An AccessControlPolicy can only be removed if it was bound to the specified
		 * node through this API before. The effect of the removal only takes place
		 * upon Session.save(). Note, that an implementation default or any other
		 * effective AccessControlPolicy that has not been applied to the node before
		 * may never be removed using this method.
		 *
		 * @param absPath The absolute path to a node the prvileges shall be fetched of.
		 * @param AccessControlPolicy policy - the policy to be removed.
		 * @return void
		 *
		 * @throws PathNotFoundException if no node at absPath exists or the session does not have sufficent
		 *                                      access to retrieve a node at that location.
		 * @throws AccessControlException if no policy exists.
		 * @throws AccessDeniedException if the session lacks MODIFY_ACCESS_CONTROL privilege for the absPath node.
		 * @throws LockException if a lock applies at the node at absPath and this implementation performs
		 *                                   this validation immediately instead of waiting until save.
		 * @throws VersionException if the node at absPath is versionable and checked-in or is
		 *                                         non-versionable but its nearest versionable ancestor is checked-in
		 *                                         and this implementation performs this validation immediately instead
		 *                                         of waiting until save.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void remove_policy (string absPath, AccessControlPolicy policy);
	}
}
