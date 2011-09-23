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
	 * A node definition. Used in node type definitions.
	 */
	public interface NodeDefinition : Object, ItemDefinition {
	
		/**
		 * Gets the minimum set of primary node types that the child node must have.
		 *
		 * Returns an array to support those implementations with multiple inheritance.
		 * This method never returns an empty array. If this node definition places
		 * no requirements on the primary node type, then this method will return an
		 * array containing only the {@link NodeType} object representing nt:base, which is
		 * the base of all primary node types and therefore constitutes the least
		 * restrictive node type requirement. Note that any particular node instance
		 * still has only one assigned primary node type, but in multiple-inheritance-
		 * supporting implementations the RequiredPrimaryTypes attribute can be used
		 * to restrict that assigned node type to be a subtype of all of a specified
		 * set of node types.
		 * In implementations that support node type registration an NodeDefinition
		 * object may be acquired (in the form of a NodeDefinitionTemplate) that is
		 * not attached to a live NodeType. In such cases this method returns null.
		 *
		 * @return An array of {@link NodeType} objects.
		 */
		public abstract NodeType[] get_required_primary_types ();

		/**
		 * Returns the names of the required primary node types.
		 *
		 * If this {@link NodeDefinition} is acquired from a live {@link NodeType} this list will
		 * reflect the node types returned by get_required_primary_types, above.
		 *
		 * If this {@link NodeDefinition} is actually a {@link NodeDefinitionTemplate} that is not
		 * part of a registered node type, then this method will return the required
		 * primary types as set in that template. If that template is a newly-created
		 * empty one, then this method will return null.
		 *
		 * @return String array
		 */
		public abstract string[] get_required_primary_type_names ();

		/**
		 * Gets the default primary node type that will be assigned to the child node
		 * if it is created without an explicitly specified primary node type.
		 *
		 * This node type must be a subtype of (or the same type as) the node types
		 * returned by get_required_primary_types.
		 * If null is returned this indicates that no default primary type is
		 * specified and that therefore an attempt to create this node without
		 * specifying a node type will throw a ConstraintViolationException. In
		 * implementations that support node type registration an NodeDefinition
		 * object may be acquired (in the form of a NodeDefinitionTemplate) that is
		 * not attached to a live NodeType. In such cases this method returns null.
		 *
		 * @return a {@link NodeType} instance
		 */
		public abstract NodeType get_default_primary_type ();

		/**
		 * Returns the name of the default primary node type.
		 *
		 * If this {@link NodeDefinition} is acquired from a live {@link NodeType} this list will
		 * reflect the {@link NodeType} returned by getDefaultPrimaryType, above.
		 *
		 * If this {@link NodeDefinition} is actually a {@link NodeDefinitionTemplate} that is not
		 * part of a registered node type, then this method will return the required
		 * primary types as set in that template. If that template is a newly-created
		 * empty one, then this method will return null.
		 *
		 * @return The name of the default primary type.
		 */
		public abstract string get_default_primary_type_name();

		/**
		 * Reports whether this child node can have same-name siblings.
		 *
		 * In other words, whether the parent node can have more than one child
		 * node of this name. If this {@link NodeDefinition} is actually a NodeDefinitionTemplate
		 * that is not part of a registered node type, then this method will return the same
		 * name siblings status as set in that template. If that template is a
		 * newly-created empty one, then this method will return false.
		 *
		 * @return True, if the node my have a same-name sibling, else false.
		 */
		public abstract bool allows_same_name_siblings();
	}
}
